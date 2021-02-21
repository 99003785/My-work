# My-work
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/Use case diagram.jpeg "Use case diagram")

![Image of Use case diagram](https://octodex.github.com/images/Use case diagram.png)

![Image of Use case diagram]]https://github.com/99003785/My-work/blob/main/Use%20case%20diagram.jpeg

![Use case diagram]C:\Users\nEW u\Downloads


Requirements

Introduction
Calculator is a small, portable electronic device used to perform basic and complex operations of arithmetic. The common components of calculator are keypad, LCD Display, Battery or solar cell. 

Research

Some of the most popular calculator types are listed below.
 
Basic Calculators
Scientific Calculators
Graphing Calculators
Financial Calculators
Printing Calculators

Basic Calculators: These are the most common and basic calculators for simple arithmetic calculation like adding, subtracting, multiplication, division, percentage calculation. Some of the calculators have memory and check function as advanced feature. There are two types in Basic Calculator :
1.Pocket Calculator 
2.Desktop Calculator
These calculators most commonly comes in LCD display capacity of 8 digits to 12 digits. Basic Calculator priced from Rs. 100 to Rs. 400 depending on features and brands. Basic calculator generally used in Home and Office.

Scientific Calculators: These calculators can perform higher arithmetic and trigonometric calculations. It is generally used by higher education students and engineers. 240+ functions makes it easy to perform all types of scientific calculations.

Graphing Calculators: This is to perform graphical calculation by plotting a graph and has some functions of the scientific calculator. It has quiet a big display and resolution than the others.

Financial Calculators: A financial calculator is a calculator that performs financial functions commonly needed in business. For many direct financial calculations it has standalone keys that differentiate it from standard calculators. It may allow the user to program functions that the manufacturer has not provided by default.

Printing Calculators: These are similar to basic calculator that makes basic arithmetic calculation but has in-built printer to print the data and results in structured way. It is generally used in businesses where immediate print copy has to be made.

Arith.h
#ifndef _CALCULATOR_ARITHMETIC_H
#define _CALCULATOR_ARITHMETIC_H

#include <stdio.h>
#include <stdlib.h>

int add(int input1,int input2);//Addition function 
int subtract(int input1,int input2);//Subtraction function
int multiply(int input1,int input2);//Multiply function
int divide(int input1,int input2);//Divide function


Arith.c
#include "Arith.h"

int add(int input1,int input2)
{
	return input1+input2;
}

int subtract(int input1,int input2)
{
	return input1-input2;
}

int multiply(int input1,int input2)
{
	return input1*input2;
}

int divide(int input1,int input2)
{
	if(0==input2)
	{
		return 0;
	}
	else
	{
		return input1/input2;
	}
		
}

int mod(int input1,int input2)
{
	if(input2==0)
	{
		return 0;
	}
	else
	{
		return input1%input2;
	}
}

Main
#include "Arith.h"

int main()
{
	int inp1,inp2,add,sub,mul,divi,mod;
	printf("Enter your inputs:\n");
	scanf("%d %d",&inp1,&inp2);
	printf("Enter your choice\n 1.Add\n 2.Sub\n 3.Multiply\n 4.Divide");
	int sh;
	switch(sh)
	{
		CASE 1:
			add=add( inp1, inp2);
			printf("The added no. is %d",add);
			break;
		CASE 2:
			sub=subtract(inp1,inp2);
			printf("The subtracted no. is %d",sub);
			break;
		CASE 3:
			mul=multiply(inp1,inp2);
			printf("The multiplied no. is %d",mul);
			break;
		CASE 4:
			divi=divide(inp1,inp2);
			printf("The divide no. is %d",divi);
			break;
		CASE 5:
			mod=modulus(inp1,inp2);
			printf("The modulus no. is %d",mod);
			break;
		default:
			printf("Wrong choice");
			
	}
}






Sololearn certificate

https://www.sololearn.com/certificates/course/en/21122088/1073/landscape/png
 
