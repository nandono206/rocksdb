
db_path="/tmp/block_cache_trace"

../cmake-build-debug/db_bench --benchmarks="readrandom" --use_existing_db --db=$db_path --duration=60 \
--key_size=20 --prefix_size=20 --keys_per_prefix=0 --value_size=100 \
--cache_index_and_filter_blocks --cache_size=1048576 \
--disable_auto_compactions=1 --disable_wal=1 --compression_type=none \
--min_level_to_compress=-1 --compression_ratio=1 --num=10000000 \
--threads=16 \
-block_cache_trace_max_trace_file_size_in_bytes=1073741824 \
-block_cache_trace_sampling_frequency=1 \
