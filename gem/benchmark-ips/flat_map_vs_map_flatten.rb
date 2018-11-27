# http://work.stevegrossi.com/2014/10/25/writing-fast-and-idiomatic-ruby/
require 'benchmark/ips'
# ----- conclusion -----
# flat_map は map.flatten より約2倍早い
#
# ----- benchmark result -----
# Warming up --------------------------------------
#             flat_map    26.387k i/100ms
#          map.flatten    12.537k i/100ms
# Calculating -------------------------------------
#             flat_map    287.810k (± 1.3%) i/s -      1.451M in   5.054310s
#          map.flatten    131.341k (± 1.1%) i/s -    664.461k in   5.068302s
#                    with 95.0% confidence
#
# Comparison:
#             flat_map:   287809.6 i/s
#          map.flatten:   131341.0 i/s - 2.19x  (± 0.04) slower
#                    with 95.0% confidence

Benchmark.ips do |x|
  x.report('flat_map')    { 20.times.flat_map { |i| [i] } }
  x.report('map.flatten') { 20.times.map { |i| [i] }.flatten }

  x.compare!
end
