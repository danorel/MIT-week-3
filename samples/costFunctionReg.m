function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(theta'*X');

for i=1:m,  
    rest = 0;
    for j=1:size(theta, 1),
        rest = rest + (theta(j, 1).^(2));
    end;
    rest = rest * (lambda / (2 * m));
    J = J + (y(i) * log(h(i)) + (1 - y(i)) * log(1 - h(i))) + rest;
endfor

J = J * (-(1 / m));

for j=1:size(theta, 1),
    part = 0;
    for i=1:m,
        part = part + ((h(i) - y(i)) * X(i, j));
    endfor
    grad(j, 1) = ((1 / m) * part);
    if(j > 1)
        grad(j, 1) = grad(j, 1) + ((lambda / m) * theta(j, 1));
    endif    
endfor

% =============================================================

end
