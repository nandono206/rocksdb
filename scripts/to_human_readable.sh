trace_data_dir="./trace_data_dir"
rm -rf "$trace_data_dir"
if [ ! -e $trace_data_dir ]; then
  mkdir -p $trace_data_dir
fi

block_trace_file_path="$trace_data_dir/block_cache_trace_file"
op_trace_file_path="$trace_data_dir/op_trace_file"
io_trace_file_path="$trace_data_dir/io_trace_file"

if [ -z $disable_bcp ]; then
bct_path="../cmake-build-debug/block_cache_trace_analyzer_tool"
bct_human_file_path="$trace_data_dir/bct_human_readable_file"
$bct_path \
 -block_cache_trace_path="$block_trace_file_path"\
 -human_readable_trace_file_path="$bct_human_file_path"
fi


trace_analyzer_exec="../cmake-build-debug/trace_analyzer"
$trace_analyzer_exec \
  -analyze_get \
  -output_access_count_stats \
  -output_dir="$trace_data_dir" \
  -output_key_stats \
  -output_qps_stats \
  -convert_to_human_readable_trace \
  -output_value_distribution \
  -output_key_distribution \
  -print_overall_stats \
  -print_top_k_access=3 \
  -output_prefix=op_trace \
  -output_time_series \
  -trace_path="$op_trace_file_path"


io_trace_parser_exec="../cmake-build-debug/io_tracer_parser"
io_parser_res="$trace_data_dir/io_trace_res.log"
$io_trace_parser_exec -io_trace_file="$io_trace_file_path" >  "$io_parser_res"