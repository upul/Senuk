module Regression

using Senuk.Solvers.gd

type LinearRegression
  weights :: Vector{Float64}
end

function create(X :: Matrix{Float64}, y :: Vector{Float64},  λ :: Float64)
  X = [ones(size(y)[1])  X]
  w = gd(δf, X, y,  λ, 10000)
  lr = LinearRegression(w)
  return lr
end

function δf(w :: Vector{Float64}, X :: Matrix{Float64}, y :: Vector{Float64})
  return -2*X'*(y -X*w)
end

function predict(model :: LinearRegression, X :: Matrix{Float64})
  X = [ones(size(X)[1]) X]
  return X*model.weights
end

end
