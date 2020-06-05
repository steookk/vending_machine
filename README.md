## Usage

`bin/run_vending_machine`

The interactive flow lets the user choose an item from the list, and pay for it with the listed coins. The software gives back change and lets a user correct a wrong input.

This is a first iteration. With more time, the following features would be added:
* Items must have a quantity, so that the vending machine keeps track of how many items are left. 
* Vending machine must present a loop to keep buying more product (currently the program terminates).
* As a consequence, the vending machine keeps track of the total earnings.
* A user must be able to interrupt the flow and get his/her money back.

## Specs

`bundle exec rspec spec`

* Unit specs: I tested those parts which could have higher probability of errors (given the time constraint). In a real life situation I would have written more tests.
* Integration test: it is directly testing the script, therefore it is particularly important to prove the right behavior of the app.

## Internal
I chose to set up the project the same way I would have done in a real scenario. This means strong use of OOP, modules exposing public methods (shielding internal service classes), service objects, dependency injection. While this might seem too much, I think it's always good to setup projects in such a way that they can be easily reworked/maintained/expanded in the future: decoupling is the most important aspect to achieve this aim.