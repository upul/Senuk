using Senuk

X = Matrix{Float64}([12 22; 16 14; 11 19])
y = Vector{Float64}([34; 30; 30])
lasso = Regression.Lasso(1.3)
model = Regression.create(X, y, step_size = 0.0001, max_iter = 500,
                          verbose = true, regularization = lasso)
y_predict = Regression.predict(model, X)
@printf("predicted responses: %s\n", y_predict)
@printf("actual responses: %s\n", "[34; 30; 30]")
