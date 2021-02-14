%% Iterated Assignment with the Assignment Block
% This example shows using the Assignment block to assign values computed
% in a For or While Iterator loop to successive elements. You can use
% vector, matrix or multidemensional signals and do the assignment in a
% single time step. In this model, the For Iterator block creates a vector
% signal each of whose elements equals $3*i$ where $i$ is the index of the
% element.
open_system('ex_assignment_block_with_for_iterator');
open_system('ex_assignment_block_with_for_iterator/For Iterator Subsystem');
sim('ex_assignment_block_with_for_iterator');
%%
% The iterator generates indices for the Assignment block. On the first 
% iteration, the Assignment block copies the first
% input (Y0) to the output (Y) and assigns the second input (U) to the output
% Y(E1). On successive iterations, the Assignment block assigns the current 
% value of U to Y(Ei), that is, without first copying Y0 to Y. These actions
% occur in a single time step.