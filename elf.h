typedef struct
{
  unsigned char	e_ident[EI_NIDENT = 16];	/* Индефикатор ELF-файла: 7А 45 4С - Magic number and other info */
  Elf32_Half	e_type;			/* Тип файла - Object file type */
  Elf32_Half	e_machine;		/* Архитектура - Architecture */
  Elf32_Word	e_version;		/* Версия объектного файла - Object file version */
  Elf32_Addr	e_entry;		/* Виртуальный адрес точки входа - Entry point virtual address */
  Elf32_Off	e_phoff;		/* Физическое семещение Program header в файле - Program header table file offset */
  Elf32_Off	e_shoff;		/* Физическое семещение Section header в файле- Section header table file offset */
  Elf32_Word	e_flags;		/* Флаги - Processor-specific flags */
  Elf32_Half	e_ehsize;		/* Размер ELF заголовка в байтах - ELF header size in bytes */
  Elf32_Half	e_phentsize;	/* Размер элемента Program header в байтах - Program header table entry size */
  Elf32_Half	e_phnum;		/* Кол-во элементов в Program header - Program header table entry count */
  Elf32_Half	e_shentsize;	/* Размер элемента Section header в байтах - Section header table entry size */
  Elf32_Half	e_shnum;		/* Кол-во элементов в Section header - Section header table entry count */
  Elf32_Half	e_shstrndx;		/* Индекс string table в section header - Section header string table index */
} Elf32_Ehdr;
