#!/bin/bash

>&2 echo "Wait 60 + 10 seconds"

threadnames=(
    'webrtc_audio_mo'
    'threaded-ml'
    'QSGRenderThread'
    'zoom.network'
    'zoom.user'
    'vrc_d_thread'
    'zoom'
    'zlt.tid13480'
    'vda_thread'
    'QThread')

declare PIDS=$(pgrep zoom)


bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[0]} 0 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[1]} 1 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[2]} 2 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[3]} 3 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[4]} 4 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[5]} 5 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[6]} 6 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[7]} 7 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[8]} 8 &
bpftrace --unsafe thread_timing.bt $PIDS ${threadnames[9]} 9 &

#sleep 10

#declare JOBS=$(pgrep bpftrace)
#kill -2 $JOBS

wait
