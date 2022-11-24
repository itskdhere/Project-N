#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <process.h>
#include <string.h>

struct Node 
{
    char *name;
    unsigned long long int phone;
    //struct Node *next;
    node *next;
};

typedef struct Node node;
node *head;


void createContact();
void deleteContact();
void searchContact();
void showAllContacts();

int main(void)
{   
    int choice;
    do
    {
        printf("\n\n*********Main Menu*********\n");
        printf("\nChoose one option from the following list ...\n");
        printf("\n===============================================\n");
        printf("\n0. Exit :(\n1. Create\n2. Delete\n3. Search\n4. Show All Contacts\n");
        printf("\nEnter your choice?\n");

        scanf("\n%d", &choice);
        switch (choice)
        {
        case 0:
            exit(0);
            break;
        case 1:
            createContact();
            break;
        case 2:
            deleteContact();
            break;
        case 3:
            searchContact();
            break;
        case 4:
            showAllContacts();
            break;
        default:
            printf("Please enter valid choice..");
        }
    }while(choice!=0);

    return 0;
}


void createContact()
{
    node *ptr;
    char name;
    unsigned long long int phone;
    ptr = (node*)malloc(sizeof(node*));
    if (ptr == NULL)
    {
        printf("\nOVERFLOW");
    }
    else
    {
        printf("\nEnter Name\n");
        gets(name);
        printf("\nEnter Phone\n");
        scanf("%llu", &phone);
        ptr->name = name;
        ptr->phone =phone;
        ptr->next = head;
        head = ptr;
        printf("\nNode inserted");
    }
    free(ptr);
}

void deleteContact()
{

}

void searchContact()
{

}

void showAllContacts()
{

}