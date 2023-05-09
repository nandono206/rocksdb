exec_path="../cmake-build-debug/db_bench"

$exec_path  --benchmarks="mixgraph,stats" --use_direct_io_for_flush_and_compaction=true --use_direct_reads=true \
--keyrange_num=1 --value_k=0.2615 --value_sigma=25.45 --iter_k=2.517 --iter_sigma=14.236 --mix_get_ratio=0.83 \
--mix_put_ratio=0.14 --mix_seek_ratio=0.03 --sine_mix_rate_interval_milliseconds=5000 --sine_a=1000 --sine_b=0.73 \
--sine_d=4500000000 –-perf_level=2 --key_size=48 --cache_size=100663296 \
--cache_index_and_filter_blocks=true --statistics > random_1000.txt