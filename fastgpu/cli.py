from fastcore.all import *
from fastscript.core import call_parse,Param
from .core import *

@call_parse
def fastgpu_poll(
    path:Param("Path containing `to_run` directory", str)='.',
    exit:Param("Exit when `to_run` is empty", int)=1,
    num_workers:Param("Number of workers, int", int)=1
):
    "Poll `path` for scripts using `ResourcePoolGPU.poll_scripts`"
    rp = ResourcePoolGPU(path=path)
    rp.poll_scripts(exit_when_empty=exit, num_workers=num_workers)

