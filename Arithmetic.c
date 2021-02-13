#include<stdio.h>
#include<math.h>
int add(int,int);
<<<<<<< HEAD
int sub(int,int);
int mul(int,int);
int divide(int,int);
void main()
{
   int input1,input2;
   printf("enter two num:\n");
   scanf("%d %d",&input1,&input2);
   int ad= add(input1,input2);
   printf("The sum is %d",ad);
   int su = sub(input1,input2);
   printf("The subtraction is %d",su);
   int mu = mul(input1,input2);
   printf("The multiplication is",mu);
   int di = divide(input1,input2);
   printf("The division is",di);

   return 0;
   }
=======
int subtraction(int,int);
int multi(int,int);
int divide(int,int);
void main()
{
   printf("enter two num:\n");
   
}
>>>>>>> 2ba725206b235a8d8a117539d53a0e36b7336178

int add(int a,int b )
{
     int sum = a+b;
    return sum;
}

<<<<<<< HEAD
int sub(int a,int b )
{
     int subtract = a-b;
    return subtract;
}


int mul(int a,int b )
{
     int multiply = a*b;
    return multiply;
}


int divide(int a,int b )
{
     int div = a/b;
    return div;
}