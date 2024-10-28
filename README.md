# MuTalk (µ-talk)
Mutation Testing in Smalltalk
<a href="https://www.pharo.org">
    <img alt="Pharo" src="https://img.shields.io/static/v1?style=for-the-badge&message=Pharo&color=3297d4&logo=Harbor&logoColor=FFFFFF&label=" />
</a>
[![Build status](https://github.com/pavel-krivanek/mutalk/workflows/CI/badge.svg)](https://github.com/pavel-krivanek/mutalk/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pavel-krivanek/mutalk/badge.svg?branch=master)](https://coveralls.io/github/pavel-krivanek/mutalk?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pavel-krivanek/mutalk/master/LICENSE)

This project was originally developed at the University of Buenos Aires (Argentina) by Nicolás Chillo, Gabriel Brunstein and others in times of Pharo 1.1.

## How to load

* Latest release:
```smalltalk
Metacello new
  baseline: 'MuTalk';
  repository: 'github://pharo-contributions/mutalk:v2.3.0/src';
  load.
```
* Full version:
```smalltalk
Metacello new
  baseline: 'MuTalk';
  repository: 'github://pharo-contributions/mutalk/src';
  load.
```

## Quick start

```smalltalk
"Put here the classes you want to mutate"
classesToMutate := {  }.
"Put here the test classes associated with"
testClasses :=  {  }.

analysis := MTAnalysis new
    classesToMutate: classesToMutate;
    testClasses: testClasses.

analysis run.

"To inspect the results"
analysis generalResult inspect.
```

## Wiki

You can find a wiki [here](https://github.com/pharo-contributions/mutalk/wiki) with a lot of information about MuTalk and how it works. It is higly recommended to read it.

---

Original repository: http://www.squeaksource.com/MutationTesting

ESUG presentation: https://www.slideshare.net/esug/mutation-testing

Master thesis (in spanish): http://gestion.dc.uba.ar/media/academic/grade/thesis/brunstein.pdf

> Following text is copy from https://code.google.com/archive/p/mutalk/

## Mutation testing

During the 70s, mutation testing emerged as a technique to assess the fault-finding effectiveness of a test suite. It works mutating objects' behavior and looking for tests to “kill” those mutants. The surviving mutants are the starting point to writing better tests. Thus, this technique is an interesting alternative to code coverage regarding test quality.

However, so far it is a “brute force” technique that takes too long to provide useful results. This characteristic has forbidden its widespread and practical use regardless the existence of new techniques, such as schema-based mutation and selective mutation. Additionally, there are no mutation testing tools (to our knowledge) that work on meta-circular and dynamic environments, such as Smalltalk, so compile and link time are the current technique's bottleneck.

This Smalltalk-based tool was developed at the University of Buenos Aires (Argentina) in the context of the final thesis work. The tool uses Smalltalk's dynamic and meta-programming facilities to notably reduce the time to get valuable output and help to understand and implement new tests due to its integration with the rest of the environment.
