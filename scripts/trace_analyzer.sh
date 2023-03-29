
trace_analyzer_exec="../cmake-build-debug/trace_analyzer"
trace_data_dir="./manual_tracing_29032023"
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
  -trace_path="/tmp/op_trace_file"

