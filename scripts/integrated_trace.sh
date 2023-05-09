#op_trace_file_path= "/tmp/op_trace_file"
#block_trace_file_path= "/tmp/block_cache_trace_file"
#io_trace_file_path= "/tmp/io_trace_file"
#
#data_dir="../trace_data_dir/manual1"

rm -rf $data_dir
mkdir -p $data_dir

trace_analyzer="../cmake-build-debug/trace_analyzer"
$trace_analyzer \
  -analyze_get \
  -output_access_count_stats \
  -output_dir="../trace_data_dir/manual1"\
  -output_key_stats \
  -output_qps_stats \
  -convert_to_human_readable_trace \
  -output_value_distribution \
  -output_key_distribution \
  -print_overall_stats \
  -print_top_k_access=3 \
  -output_prefix=op_trace \
  -output_time_series \
  -trace_path="/tmp/op_trace_file"

block_cache_trace_analyzer= "../cmake-build-debug/block_cache_trace_analyzer"
bct_human_file_path="$data_dir/block_trace_human_file"
$block_cache_trace_analyzer \
 -block_cache_trace_path="/tmp/block_cache_trace_file" \
 -human_readable_trace_file_path="../trace_data_dir/manual1"

io_tracer ="../io_tracer_parser"
$io_tracer -io_trace_file="/tmp/io_trace_file" > "../trace_data_dir/manual1/human_readable_io"


#io_trace_parser_exec="/home/bily/rocksdb_tracing/build/io_tracer_parser"
#io_parser_res="$data_dir/io_trace_res"
#$io_trace_parser_exec -io_trace_file="$io_trace_file_path" >  "$io_parser_res"