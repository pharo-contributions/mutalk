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
- UI is under working. There is a custom inspector tab to better visualise the results

## How to load
```smalltalk
Metacello new
  baseline: 'MuTalk';
  repository: 'github://pavel-krivanek/mutalk/src';
  load.
```

## Analysis

```smalltalk
| analysis alive browser |
analysis := MutationTestingAnalysis
    testCasesFrom: {UUIDPrimitivesTest}
    mutating: {UUID. UUIDGenerator}
    using: MutantOperator contents
    with: AllTestsMethodsRunningMutantEvaluationStrategy new.
analysis run.
"To retrieve the alive mutations"
alive := analysis generalResult aliveMutants.
"To inspect the results"
analysis generalResult inspect.
```
---

Original repository: http://www.squeaksource.com/MutationTesting

ESUG presentation: https://www.slideshare.net/esug/mutation-testing

> Following text is copy from https://code.google.com/archive/p/mutalk/

## Mutation testing

During the 70s, mutation testing emerged as a technique to assess the fault-finding effectiveness of a test suite. It works mutating objects' behavior and looking for tests to “kill” those mutants. The surviving mutants are the starting point to writing better tests. Thus, this technique is an interesting alternative to code coverage regarding test quality.

However, so far it is a “brute force” technique that takes too long to provide useful results. This characteristic has forbidden its widespread and practical use regardless the existence of new techniques, such as schema-based mutation and selective mutation. Additionally, there are no mutation testing tools (to our knowledge) that work on meta-circular and dynamic environments, such as Smalltalk, so compile and link time are the current technique's bottleneck.

This Smalltalk-based tool was developed at the University of Buenos Aires (Argentina) in the context of the final thesis work. The tool uses Smalltalk's dynamic and meta-programming facilities to notably reduce the time to get valuable output and help to understand and implement new tests due to its integration with the rest of the environment.

## FAQ

> How can I run a mutation testing analysis on my packages?

There are several ways: * open the Mutation Testing Runner, to do that you can go to Tools->More...->Mutation Testing Runner, or you can simply evaluate: MutationTestRunner open * within the Class Browser, go to your tests package. You can right click on the package, a class or a test method and then click on run mutations (shortcut: ALT + u)

> What is the difference between each running mode?

We have four modes: * Mutate All, Run All: it means mutating all your code and then running all tests. * Mutate All, run Covering: it means mutating all your code but, for each mutated method, running tests that cover it. The result should be, in general, the same than running Mutate All, Run All, but taking less time. * Mutate Covered, Run All: it means mutating only code covered by tests and then running all tests. * Mutate Covered, Run Covering: it means mutating covered code and, for each mutated method, running tests that cover it. The result must be, in general, the same than running Mutate Covered, run All, but taking less time.

> What is the default mode to run mutation testing?

Mutate Covered, Run Covering or maybe Mutate All, run Covering if you are not measuring coverage before running mutation testing.

> Does MuTalk replace coverage analysis?

No, it doesn't. It complements coverage. We should first try to write all the tests to achieve a high coverage score on the code we want to mutate. We can then run mutation testing in Mutate Covered, Run Covering mode.

> My image is freezing when running a mutation testing analysis, what can I do?

You can can open the Mutation Testing Runner and then Activate Logging to File. It will generate a file called MutationTestingLog.txt which lets you know which mutant is causing your image to freeze. You can install the mutation by hand, and then debug running your tests. You will probably need to exclude a class or an operator from the analysis.
