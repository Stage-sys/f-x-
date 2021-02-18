OUTPUT_FORMAT(binary)
OUTPUT_ARCH(sh4)
ENTRY(_start)

MEMORY
{
        rom (rx) : o = 0x00300000, l = 2M
        ram (rw) : o = 0x88000000, l = 4k
}
 
SECTIONS
{
        .text : {
		*(.text.entry)
                *(.text)
                *(.text.*)
		. = ALIGN(0x100);
		_VBR_Address = . ;
		. = _VBR_Address + 0x100 ;
		_EXH_BEGIN = ABSOLUTE(.) ;
		*(.exh) ;
        } > rom

        .rodata : {
                *(.rodata)
                *(.rodata.*)
        } > rom

	. = ORIGIN(ram);

 	.bss (NOLOAD) : {
                _BSS_LMA = . ;
                *(.bss.vram)
                *(.bss COMMON)
		. = ALIGN(16);
        } >ram :NONE
	_BSS_SIZE = SIZEOF(.bss) ;

        .data ALIGN(4) : ALIGN(4) {
                _DATA_LMA = LOADADDR(.data) ;
                _DATA_VMA = . ;
                *(.data)
                *(.data.*);
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


