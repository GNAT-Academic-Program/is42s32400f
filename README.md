# is42s32400f

IS42S32400F SDRAM chip driver for bare-metal Ada applications.

## Overview

`is42s32400f` provides a driver for the ISSI IS42S32400F SDRAM chip (16MB, 4M x 32-bit). It implements the `sdram_generic` interface over FMC, providing chip-specific timing and initialization sequences.

## Features

- IS42S32400F chip-specific parameters
- FMC SDRAM controller configuration
- Automatic initialization sequence
- 16MB capacity (4M x 32-bit)

## Integration

```toml
[[depends-on]]
is42s32400f = "^0.1.0"
```

## Dependencies

- `sdram_generic` - SDRAM controller interface

## License

MIT OR Apache-2.0 WITH LLVM-exception
