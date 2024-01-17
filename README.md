# MuTalk (µ-talk)
Mutation Testing in Smalltalk

[![Build status](https://github.com/pavel-krivanek/mutalk/workflows/CI/badge.svg)](https://github.com/pavel-krivanek/mutalk/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pavel-krivanek/mutalk/badge.svg?branch=master)](https://coveralls.io/github/pavel-krivanek/mutalk?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pavel-krivanek/mutalk/master/LICENSE)

This project was originally developed at the University of Buenos Aires (Argentina) by Nicolás Chillo, Gabriel Brunstein and others. It was created in times of Pharo 1.1 and the last versions on which MuTalk can run is Pharo 1.3. This is resurection of this project.

### Current status 

- all tests are green
- mutation analysis works
- UI is under working. There is already a custom inspector tab to better visualise the results

## How to load
```smalltalk
Metacello new
  baseline: 'MuTalk';
  repository: 'github://pharo-contributions/mutalk/src';
  load.
```

## Analysis

```smalltalk
| analysis alive testClasses classesToMutate |
testClasses :=  { UUIDPrimitivesTest }.
classesToMutate := { UUID . UUIDGenerator }.

analysis := MTAnalysis new
    classesToMutate: classesToMutate;
    testClasses: testClasses.

analysis run.

"To retrieve the alive mutations"
alive := analysis generalResult aliveMutants.

"To inspect the results"
analysis generalResult inspect.
```
---

Original repository: http://www.squeaksource.com/MutationTesting

ESUG presentation: https://www.slideshare.net/esug/mutation-testing

Master thesis (in spanish): http://gestion.dc.uba.ar/media/academic/grade/thesis/brunstein.pdf

> Following text is copy from https://code.google.com/archive/p/mutalk/

## Mutation testing

During the 70s, mutation testing emerged as a technique to assess the fault-finding effectiveness of a test suite. It works mutating objects' behavior and looking for tests to “kill” those mutants. The surviving mutants are the starting point to writing better tests. Thus, this technique is an interesting alternative to code coverage regarding test quality.

However, so far it is a “brute force” technique that takes too long to provide useful results. This characteristic has forbidden its widespread and practical use regardless the existence of new techniques, such as schema-based mutation and selective mutation. Additionally, there are no mutation testing tools (to our knowledge) that work on meta-circular and dynamic environments, such as Smalltalk, so compile and link time are the current technique's bottleneck.

This Smalltalk-based tool was developed at the University of Buenos Aires (Argentina) in the context of the final thesis work. The tool uses Smalltalk's dynamic and meta-programming facilities to notably reduce the time to get valuable output and help to understand and implement new tests due to its integration with the rest of the environment.

## FAQ

> How can I run a mutation testing analysis on my packages?

Currently you need to write a script in the playground (shortcut: CTRL + O + W) like the one above.

In the future we plan to improve the UI to allow MuTalk to be used:
* in the Mutation Testing Runner
* within the Class Browser

> What is the difference between each running mode?

We have four modes to run an analysis:
* Mutate All, Run All: it means mutating all your code and then running all tests.
    * ```smalltalk
      analysis mutantSelectionStrategy: MTAllMutantSelectionStrategy new;
	  testSelectionStrategy: MTAllTestsMethodsRunningTestSelectionStrategy new.
      ```
* Mutate All, run Covering: it means mutating all your code but, for each mutated method, running tests that cover it. The result should be, in general, the same than running Mutate All, Run All, but taking less time.
    * ```smalltalk
      analysis mutantSelectionStrategy: MTAllMutantSelectionStrategy new;
	  testSelectionStrategy: MTSelectingFromCoverageTestSelectionStrategy new.
      ```
* Mutate Covered, Run All: it means mutating only code covered by tests and then running all tests.
    * ```smalltalk
      analysis mutantSelectionStrategy: MTSelectingFromCoverageMutantSelectionStrategy new;
	  testSelectionStrategy: MTAllTestsMethodsRunningTestSelectionStrategy new.
      ```
* Mutate Covered, Run Covering: it means mutating covered code and, for each mutated method, running tests that cover it. The result must be, in general, the same than running Mutate Covered, run All, but taking less time.
    * ```smalltalk
      analysis mutantSelectionStrategy: MTSelectingFromCoverageMutantSelectionStrategy new;
	  testSelectionStrategy: MTSelectingFromCoverageTestSelectionStrategy new.
      ```

> What are the options when running an analysis?

There are various options you can play with.
You can change the mutant selection strategy as we presented above, but there are more. You can manually give the methods to be mutated with `MTManualMutatedMethodSelectionStrategy`, or directly give the mutations with `MTManualMutationSelectionStrategy`.
You can also randomize the mutations order with `MTRandomMutantSelectionStrategy`. This strategy relies on another mutant selection strategy (by default it is the all mutant one) to generate the mutations, then it shuffles the collection of mutations. Another option is to use `MTRandomOperatorMutantSelectionStrategy`, which randomly selects a mutant operator then randomly selects a mutation from this operator.

Theses random strategies are especially useful when paired with budgets, in particular the ones on number of mutants. Budgets are meant to impose a limitation on the analysis.  
There are 4 types:
* No budget: the analysis will run until finished or until it encounters a bug.
  * ```smalltalk
    analysis budget: MTFreeBudget new.
    ```
* Budget on a fixed number of mutants: the analysis will stop when the given number of mutants have been evaluated.
  * ```smalltalk
    analysis budget: (MTFixedNumberOfMutantsBudget for: 10).
    ```
* Budget on a percentage of mutants: the analysis will stop when the given percentage of mutants have been evaluated. If the percentage gives a non exact number of mutants (for instance 7.6 mutants), it stops at the rounded up number (here it would be 8 mutants).
  * ```smalltalk
    analysis budget: (MTPercentageOfMutantsBudget for: 10).
    ```
* Budget on time: the analysis will run until the given time as passed. If a mutant is being evaluated when the time is up, the analysis continues until this evaluation is finished.
  * ```smalltalk
    analysis budget: (MTTimeBudget for: 10 seconds).
    ```

When evaluating a mutant the analysis installs the mutation, runs all tests, and at the first failing test it ends the evaluation, uninstalls the mutation and moves on to the next mutant. However in some cases you need the analysis to run all tests and do not stop at the first failing test.  
You can do that in MuTalk with this option:
```smalltalk
analysis doNotStopOnErrorOrFail.
```

> What is the default mode to run mutation testing?

The default parameters are: mutate all, run all, no budget and stop at first fail.

> Does MuTalk replace coverage analysis?

No, it doesn't. It complements coverage. We should first try to write all the tests to achieve a high coverage score on the code we want to mutate. We can then run mutation testing in Mutate Covered, Run Covering mode.

> My image is freezing when running a mutation testing analysis, what can I do?

You can can open the Mutation Testing Runner and then Activate Logging to File. It will generate a file called MutationTestingLog.txt which lets you know which mutant is causing your image to freeze. You can install the mutation by hand, and then debug running your tests. You will probably need to exclude a class or an operator from the analysis.
