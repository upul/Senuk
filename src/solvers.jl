module Solvers

using Senuk.PrintUtils.print_iter_head
using Senuk.PrintUtils.print_iter
using Senuk.PrintUtils.print_blank_line

function gd(δf :: Function, X :: Matrix{Float64}, y :: Vector{Float64},
            step_size :: Float64, max_iter :: Int64, verbose :: Bool)
  w = zeros(size(X)[2])
  print_steps = 50

  print_iter_head()
  for i in 1:max_iter
    cost, Δcost = δf(w, X, y)
    if verbose && i % print_steps == 0
      print_iter(i, cost)
    end
    w = w - step_size*Δcost
  end
  print_blank_line()
  return w
end

end
