# Bank Tech Test
The purpose of this project is to become more familiar with the tech test process and to feel more confident in approaching a tech test challenge. 
Goals for the week:
- [ ] Can you solve a challenging technical problem by writing well crafted code?
- [ ] Feel more confident in your ability to complete a tech test.
- [ ] Have developed a structured process to approaching complex problems, utilising TDD and good OO design skills.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date       || credit     || debit   || balance
14/01/2012 ||            || 500.00  || 2500.00
13/01/2012 || 2000.00    ||         || 3000.00
10/01/2012 || 1000.00    ||         || 1000.00
```

## Approach

### Planning
1. Break specification into user stories
2. Extract nouns and verbs from user stories
3. Build table of objects (nouns) and methods (verbs)
4. Draw a domain model diagram that shows how program functions


### User Stories
```
As a hard working person
So that I can keep my income in a safe place
I would like to be able to deposit money into my account

As a hard working person
So that I can treat myself to something nice
I would like to withdraw money from my account

As a hard working person
So that I can keep on top of my finances
I would like to print a detailed account statement
```

### Program Objects and Methods
| Objects (nouns)  |  Methods (verbs) |
|---|---|
|Account   |deposit|
| |withdraw |
|Account Statement| print Statement | 

## Running the program

Getting set up on your machine:
```
$ git clone https://github.com/ayelishaamoah/bank-test-ruby.git
$ bundle install
```


This program is run using irb - the below path is relative to the main app folder:
```
$ irb -r './lib/bank.rb'
```

### How to us the program
```
2.6.0 :001 > bank = Bank.new
 => #<Bank:0x00007fba56823c38 @balance=0, @transactions=[], @transaction=Transaction>
2.6.0 :002 > bank.deposit(1000)
 => 1000
2.6.0 :003 > bank.withdraw(500)
 => 500
2.6.0 :004 > bank.print_statement
date       || credit    || debit     || balance
04/06/2019 ||           || 500.00    || 500.00
04/06/2019 || 1000.00   ||           || 1000.00
 => nil
2.6.0 :005 > quit
```

### Running the tests
From the root folder run the command ```rspec``` 
