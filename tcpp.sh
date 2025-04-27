sudo cp /etc/sysctl.conf /etc/sysctl.conf.bk_$(date +%Y%m%d_%H%M%S) && sudo sh -c 'echo "
# ---------------------------------------------------
# 基础内核与系统配置
# ---------------------------------------------------
fs.file-max = 2097152
kernel.pid_max = 65535
kernel.panic = 1
kernel.sysrq = 1
kernel.core_pattern = core_%e
kernel.printk = 3 4 1 3
kernel.numa_balancing = 0
kernel.sched_autogroup_enabled = 0

# ---------------------------------------------------
# 内存管理优化
# ---------------------------------------------------
vm.swappiness = 10
vm.dirty_ratio = 10
vm.dirty_background_ratio = 5
vm.panic_on_oom = 1
vm.overcommit_memory = 1
vm.min_free_kbytes = 204800

# ---------------------------------------------------
# 网络栈优化
# ---------------------------------------------------
# 网络设备队列与缓冲
net.core.default_qdisc = fq
net.core.netdev_max_backlog = 5000
net.core.rmem_max = 134217728
net.core.wmem_max = 67108864
net.core.rmem_default = 1048576
net.core.wmem_default = 1048576
net.core.somaxconn = 65535
net.core.optmem_max = 65536

# TCP连接优化
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_max_orphans = 65536
net.ipv4.tcp_max_tw_buckets = 1440000
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_rfc1337 = 1

# TCP性能增强
net.ipv4.tcp_syn_retries = 3
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_abort_on_overflow = 0
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_adv_win_scale = -2
net.ipv4.tcp_notsent_lowat = 131072
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_bbr_plb_enabled = 1
net.ipv4.tcp_bbr_pacing_gain = 1.5

# TCP缓冲区调整
net.ipv4.tcp_rmem = 4096 262144 67108864
net.ipv4.tcp_wmem = 4096 16384 67108864

# 丢包恢复与MTU优化
net.ipv4.tcp_sack = 1
net.ipv4.tcp_dsack = 1
net.ipv4.tcp_fack = 1
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_ecn = 1
net.ipv4.tcp_slow_start_after_idle = 0

# ---------------------------------------------------
# 安全防护配置
# ---------------------------------------------------
net.ipv4.tcp_syncookies = 1
net.ipv4.ip_local_port_range = 1024 65535
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.arp_announce = 2
net.ipv4.conf.default.arp_announce = 2
net.ipv4.conf.all.arp_ignore = 1
net.ipv4.conf.default.arp_ignore = 1

# ---------------------------------------------------
# 邻居表与路由缓存优化
# ---------------------------------------------------
net.ipv4.route.gc_timeout = 100
net.ipv4.neigh.default.gc_stale_time = 120
net.ipv4.neigh.default.gc_thresh1 = 1024
net.ipv4.neigh.default.gc_thresh2 = 4096
net.ipv4.neigh.default.gc_thresh3 = 8192
" > /etc/sysctl.conf' && sudo sysctl -p
