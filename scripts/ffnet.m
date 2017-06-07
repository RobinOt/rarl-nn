function net = ffnet(hiddenLayers, costFunction, epochs, showGUI)

% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 24-May-2017 14:35:24
%
% This script assumes these variables are defined:
%
%   X - input data.
%   Y - target data.

% x = X;
% t = Y;

% Choose a Training Function
% ------------------------------------------------------------------
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainbr';  % Scaled conjugate gradient backpropagation.
% ------------------------------------------------------------------

% Create a Fitting Network
% ------------------------------------------------------------------
% per default there will be size(hiddenLayers) + 1 layers
% change 'fitnet' to another neural net architecture if needed
net = fitnet(hiddenLayers,trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
% net.input.processFcns = {'removeconstantrows','mapminmax'};
% net.output.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'divideint';  % Divide data based on intervals
net.divideMode = 'sample';  % Divide up every sample

% we only use this for RL training, we don't have a testRatio/valRatio
net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 25/100;
net.divideParam.testRatio = 0/100;

% how often can the validation error rise
net.trainParam.max_fail = 100; 

% only L2 regularisation is possible (1/n * sum(w^2))
net.performParam.regularization = 0.5;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = costFunction;

% We only have want to learn one-by-one, because we don't have batches in RL
net.trainParam.epochs = epochs;

% Don't open unneeded GUIs
net.trainParam.showWindow = showGUI;



% ------------------------------------------------------------------

end
% Choose Plot Functions
% ------------------------------------------------------------------
% For a list of all plot functions type: help nnplot
% net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
%    'plotregression', 'plotfit'};
% ------------------------------------------------------------------

% Train the Network
% ------------------------------------------------------------------
%[net,tr] = train(net,x,t);
% ------------------------------------------------------------------


% View the Network
% view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)

% Deployment
% ------------------------------------------------------------------
% Chang
% Deployment
% ------------------------------------------------------------------
% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
% if (false)
    % Generate MATLAB function for neural network for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % network performs.
%     genFunction(net,'nnet');
%     y = nnet(x);
% end
% if (false)
    % Generate a matrix-only MATLAB function for neural network code
    % generation with MATLAB Coder tools.
%     genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
%     y = myNeuralNetworkFunction(x);
% end
% if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
%     gensim(net);
%end
% ------------------------------------------------------------------
