function tests = test_custom_medfilt1
tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    % TODO:
    %
    % woudl be nice to import dsp_tools.custom_medfilt1 once
    % in a function like this one
end

function test_assertion_is_input_signal_a_vector(testCase)
import dsp_tools.custom_medfilt1

verifyError( ...
    testCase, ...
    @() custom_medfilt1([1 2; 3 4], 3), ...
    'custom_medfilt1:inputSignalNotAVectorError' ...
    )
end

function test_assertion_is_window_size_odd(testCase)
import dsp_tools.custom_medfilt1

verifyError( ...
    testCase, ...
    @() custom_medfilt1([1 2 3 4], 2), ...
    'custom_medfilt1:windowDimensionError' ...
    )
end

function test_assertion_is_input_signal_longer_than_window_size(testCase)
import dsp_tools.custom_medfilt1

verifyError( ...
    testCase, ...
    @() custom_medfilt1([1 2 3], 3), ...
    'custom_medfilt1:inputSignalTooShortError' ...
    )
end

function test_output_signal_sample_length(testCase)
import dsp_tools.custom_medfilt1

input_signal = [1 2 3 4 123 5 234 6];
output_signal = custom_medfilt1(input_signal, 3);
verifyEqual(testCase, length(input_signal), length(output_signal))
end