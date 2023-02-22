while [[ $# -gt 0 ]]; do
  case $1 in
    --disable_bcp)
      disable_bcp=1
      shift
      shift
      ;;
  esac
done

trace_data_dir="./new_trace_data_dir"


block_trace_file_path="$trace_data_dir/block_cache_trace_file"

if [ -z $disable_bcp ]; then
bct_path="../cmake-build-debug/block_cache_trace_analyzer"
bct_human_file_path="$trace_data_dir/bct_human_readable_file"
$bct_path \
 -block_cache_trace_path="/tmp/binary_trace_test_example"\
 -human_readable_trace_file_path="$bct_human_file_path"
fi