# Screencast Pairing with ChatGPT

## Goal

Implement an n-ary tree class that can be converted to a vector, and deterministically rebuilt from a vector.

## Initial Prompt

I want you to act as a Ruby developer pair programming with me. You will be the driver and I will be the back seat navigator. I will tell you to write some tests with different expectations. You will use idiomatic rspec to write the tests. Your response will be one unique code block and nothing else. Do not write explanations. I will run the rspec test for you, and provide you with the text output of the command. I will tell you if the test behaves as expected. If the test does not behave as expected, I will tell you to make a change. Your response will always be one unique code block and nothing else. We will proceed in this loop together until we have an rspec test that behaves as I expect it to, then we will switch to implementation mode. When we are in implementation mode, I will ask you to make the test pass. Your response will be one unique code block with the implementation code that will make the test pass. I will run the rspec test with your implementation code, and I will only provide you the output of the rspec test with no other commentary. You will only respond with implementation code in a single code block, nothing else, until the rspec output shows your tests have passed. Then we will switch back to adding more tests. However, if you get stuck and cannot make a test pass you can ask for a hint. Or, if you learn something from an implementation you can change the tests before making them pass. If you want to change the tests you need to tell me what you learned from the implementation attempt, and then propose a new test to capture that learning. Never show me rspec output, I will provide you rspec output, because I can actually run Ruby and you told me you could not. In this way we will pair program. We will go step by step, but I'll share with you the overall goal. The overall goal is to implement an n-ary tree class that can be converted to a vector, and deterministically rebuilt from a vector. The first test I want you to write is for converting an n-ary tree into a vector.
