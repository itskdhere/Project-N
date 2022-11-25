#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <process.h>
#include <string.h>

#define nameLimit 25
#define phoneLimit 10

struct node {
    char *name;
    char *phone;
    struct node *link;
};

struct node *head  = NULL;

void createContact();
void deleteContact();
void searchContact();
void showAllContacts();

int main(void)
{   
    int option;
    do
    {
        printf("\n\n*********Main Menu*********\n");
        printf("\nChoose one option from the following list ...\n");
        printf("\n===============================================\n");
        printf("\n0. Exit :(\n1. Create\n2. Delete\n3. Search\n4. Show All Contacts\n");
        printf("\nEnter your choice?\n");

        scanf("\n%d", &option);
        switch (option)
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
    }while(option!=0);

    return 0;
}


void createContact()
{
    struct node *nodePtr;
    nodePtr = (struct node*)malloc(sizeof(struct node*));
    char name[nameLimit], phone[phoneLimit];
    if (nodePtr == NULL)
    {
        printf("\nOVERFLOW");
    }
    else
    {
        printf("Enter Name: ");
        fflush(stdin);
        fgets(name, nameLimit, stdin);
        fflush(stdin);
        printf("Enter Phone: ");
        fflush(stdin);
        fgets(phone, phoneLimit, stdin);
        fflush(stdin);
        printf("\nNode inserted");
    }
    nodePtr->name = name;
    nodePtr->phone = phone;
    nodePtr->link = head;
    head = nodePtr;
    // free(nodePtr);
    // nodePtr = NULL;
}

void deleteContact()
{

}

void searchContact()
{
    struct node *currentNodePtr;
    currentNodePtr = head;
    if(currentNodePtr = NULL)
    {
        printf("\nList is Empty !!");
    }
    else
    {

    }
}

void showAllContacts()
{
    struct node *currentNodePtr;
    currentNodePtr = head;
    if(currentNodePtr == NULL)
    {
        printf("No Contacts Found !!");
    }
    else
    {
        printf("Showing All Contacts...");
        while(currentNodePtr != NULL)
        {
            //char phone[phoneLimit] = currentNodePtr->phone;
            //char name[nameLimit] = currentNodePtr->name;
            //printf("%s - %s",phone,name);
            printf("%s - %s", currentNodePtr->phone, currentNodePtr->name);
            currentNodePtr = currentNodePtr->link;
        }
    }
    currentNodePtr = NULL;
}