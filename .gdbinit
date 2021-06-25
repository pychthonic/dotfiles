source /usr/share/pwndbg/gdbinit.py

set disassembly-flavor att
set breakpoint pending on

set auto-load safe-path /

alias dx = disas $rip-30,+80




######################################3

source /home/sidney/software/splitmind/gdbinit.py

python
import splitmind
(splitmind.Mind()
  .left(of="main", display="regs", size="45%")
  .below(of="regs", display="disasm", size="40")
  .below(of="disasm", display="backtrace", size="20")
  .below(of="backtrace", display="stack", cmd="grep rax", use_stdin=True)
  #.below(of="main", cmd='ls -lah')
  .show("legend", on="disasm")
).build(nobanner=True)
end

