require 'benchmark/ips'
# ----- conclusion -----
# sub は gsub より3倍以上早いので不要なら不用意に用いない
#
# ----- benchmark result -----
# Warming up --------------------------------------
#                  sub   121.639k i/100ms
#                 gsub    39.958k i/100ms
# Calculating -------------------------------------
#                  sub      1.805M (± 1.5%) i/s -      9.001M in   5.007459s
#                 gsub    496.100k (± 1.6%) i/s -      2.477M in   5.013399s
#                    with 95.0% confidence
#
# Comparison:
#                  sub:  1805241.3 i/s
#                 gsub:   496099.9 i/s - 3.64x  (± 0.08) slower
#                    with 95.0% confidence

string = 'google_cloud_platform'
Benchmark.ips do |x|
  x.report('sub')    { string.sub(/\Agoogle_/, '') }
  x.report('gsub')   { string.gsub(/\Agoogle_/, '') }

  x.compare!
end
