OUTPUT_FORMAT(binary)
OUTPUT_ARCH(sh4)
ENTRY(_Entry)

MEMORY
{
        rom (rx) : o = 0x00300000, l = 1M
        ram (rwx) : o = 0x8c001000, l = 4k
	ilram (rwx) : o = 0xe5200000, l = 4k
	xram (rwx) : o = 0xe5007000, l = 8k
	yram (rwx) : o = 0xe5018fff, l = 8k
}
 
SECTIONS
{
        .text : {
		*(.text.entry) ;
		*(.text) ;
                *(.text.*) ;

		*(.text.syscall) ;

		. = ALIGN(0x100) ;
		_VBR_ADDRESS = . ;

		. = _VBR_ADDRESS + 0x100 ;
		_EXH_ADDRESS_BEGIN = ABSOLUTE(.) ;
		*(.exh) ;
		_EXH_SIZE = ABSOLUTE(.) - _EXH_ADDRESS_BEGIN ;

		. = _VBR_ADDRESS + 0X400 ;
		_TLBH_ADDRESS_BEGIN = ABSOLUTE(.) ;
		*(.tlbh) ;
		_TLBH_SIZE = ABSOLUTE(.) - _TLBH_ADDRESS_BEGIN ;

		. = _VBR_ADDRESS + 0x600 ;
		_INTH_ADDRESS_BEGIN = ABSOLUTE(.) ;
		*(.inth) ;
		_INTH_SIZE = ABSOLUTE(.) - _INTH_ADDRESS_BEGIN ;
        } > rom

        .rodata : {
                *(.rodata)
                *(.rodata.*)
        } > rom

	. = ORIGIN(ram);

 	.bss (NOLOAD) : {
                _BSS_LMA = . ;
                *(.bss COMMON) ;
		. = ALIGN(16);
        } >ram :NONE
	_BSS_SIZE = SIZEOF(.bss) ;

        .data ALIGN(4) : ALIGN(4) {
                _DATA_LMA = LOADADDR(.data) ;
                _DATA_VMA = . ;
                *(.data) ;
                *(.data.*) ;
		. = ALIGN(16);
        } >ram AT>rom
	_DATA_SIZE = SIZEOF(.data) ;


	/DISCARD/ : {
		*(.debug_info .debug_abbrev .debug_loc .debug_aranges
		  .debug_ranges .debug_line .debug_str)
		*(.jcr)
		*(.eh_frame_hdr)
		*(.eh_frame)
		*(.comment)
	}
}


