module Regression

using Senuk.Solvers.gd

type RegressionModel
  weights :: Vector{Float64}
end

abstract Regularization
type Ridge <: Regularization
  l2 :: Float64
end

type Lasso <: Regularization
  l1 :: Float64
end

function create(X :: Matrix{Float64}, y :: Vector{Float64}; step_size = 0.1,
                max_iter = 100, verbose = false, regularization = Regularization)
  if typeof(regularization) == Ridge
    # minimize Ridge cost function
    error("not implemented yet")
  end

  if  typeof(regularization) == Lasso
    # minimize Lasso cost function
    error("not implemented yet")
  end

  # regression without a regularization term
  X = [ones(size(y)[1])  X]
  w = gd(δf, X, y,  step_size, max_iter, verbose)
  lr = RegressionModel(w)
  return lr
end

function δf(w :: Vector{Float64}, X :: Matrix{Float64}, y :: Vector{Float64})
  cost = (y - X*w)'*(y - X*w)
  Δcost = -2*X'*(y -X*w)
  return (cost[1], Δcost)
end

function δf_ridge(w :: Vector{Float64}, X :: Matrix{Float64}, y :: Vector{Float64})
  cost = (y - X*w)'*(y - X*w)
  Δcost = -2*X'*(y -X*w)
  return (cost[1], Δcost)
end

function δf_lasso(w :: Vector{Float64}, X :: Matrix{Float64}, y :: Vector{Float64})
  cost = (y - X*w)'*(y - X*w)
  Δcost = -2*X'*(y -X*w)
  return (cost[1], Δcost)
end

function predict(model :: RegressionModel, X :: Matrix{Float64})
  X = [ones(size(X)[1]) X]
  return X*model.weights
end

end
