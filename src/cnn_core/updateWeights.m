function cnn = updateWeights(cnn, theta)

    % updateWeights: Update the weights of cnn
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    %   cnn = updateWeights(cnn, theta)
    %    ---------------------------------------------------------------------------------
    %    Arguments:
    %           cnn         - a cnn whose weights are initialized or specified
    %           theta       - weights to update, should be in one column
    %    Return:
    %           cnn         - updated cnn
    %    ---------------------------------------------------------------------------------
    % cnn structure
    %   layers: layers of the cnn
    %       type:                       type of the layer, could be input layer ('input'), convolutional
    %                                   and subsampling layer ('Conv2D'), full connected layer ('Linear'),
    %                                   and output layer ('output').
    %
    %       filterDim:                  dimension of filter, convolutional and
    %                                   subsampling layer ('Conv2D') only, and real
    %                                   filter size is filterDim*filterDim*k
    %                                   where k specifies the numbers of
    %                                   feature map.
    %
    %       numFilters:                 numbers of filters, convolutional and
    %                                   subsampling layer ('Conv2D') only
    %
    %       poolDim:                    pool dimension, convolutional and
    %                                   subsampling layer ('Conv2D') only
    %
    %       hiddenUnits                 hidden units, full connected layer
    %                                   ('Linear') and output layer ('output') only
    %
    %       actiFunc:         name of activation function, could be
    %                                   'sigmoid', 'relu' and 'tanh', default
    %                                   is 'sigmoid'
    %
    %       realActiFunc:     function handle of activation function
    %
    %       realGradFunc:       function handle of the gradients of the
    %                                   activation function
    %
    %       outDim:                     output dimension
    %
    %       W:                          weights
    %
    %       b:                          bias
    %
    %       convolvedFeatures:          convolved features
    %
    %       activations:                'input' of the next layer
    %
    %       delta:                      sensitivities
    %
    %       Wgrad:                      gradients of weights
    %
    %       bgrad:                      gradients of bias
    %
    %       softmax                     if 1, implement softmax in output
    %                                   layer, output layer ('output') only

    numLayers = size(cnn.layers, 1);
    curIdx = 1;

    for i = 1:numLayers - 1
        szW = size(cnn.layers{i}.W);
        numW = numel(cnn.layers{i}.W);
        W = theta(curIdx:curIdx + numW - 1);
        cnn.layers{i}.W = reshape(W, szW);
        curIdx = curIdx + numW;
    end

    for i = 1:numLayers - 1
        numb = numel(cnn.layers{i}.b);
        b = theta(curIdx:curIdx + numb - 1);
        cnn.layers{i}.b = b;
        curIdx = curIdx + numb;
    end
