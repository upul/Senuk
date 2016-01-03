using Senuk

X = Matrix{Float64}([12 22; 16 14; 11 19])
y = Vector{Float64}([34; 30; 30])
model = Regression.create(X, y, 0.00001)
println(model.weights)
p = Regression.predict(model, X)
println(p)
