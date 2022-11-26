#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <process.h>
#include <string.h>

#define nameLimit 25
#define phoneLimit 11

struct node
{
    char name[25];
    char phone[11];
    struct node *nextNodeLink;
};

struct node *head;

void createContact();
void createContactm();
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
        fflush(stdin);
        printf("\nEnter your choice?\n");
        scanf("\n%d", &option);
        fflush(stdin);
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
    } while (option != 0);

    return 0;
}

void createContactm()
{
    struct node *currentNodePtr, *tempNodePtr;
    currentNodePtr = (struct node *)malloc(sizeof(struct node *));
    char name[25];
    char phone[11];
    if (currentNodePtr == NULL)
    {
        printf("\nCan't Allocate Memory");
    }
    else
    {
        fflush(stdin);
        printf("Enter Name: ");
        fflush(stdin);
        gets(name);
        fflush(stdin);
        printf("Enter Phone: ");
        fflush(stdin);
        gets(phone);
        fflush(stdin);

        strcpy(currentNodePtr->name, name);
        strcpy(currentNodePtr->phone, phone);

        if (head == NULL)
        {
            currentNodePtr->nextNodeLink = NULL;
            head = currentNodePtr;
            printf("\nContact Created Successfully");
        }
        else
        {
            tempNodePtr = head;
            while (tempNodePtr->nextNodeLink != NULL)
            {
                tempNodePtr = tempNodePtr->nextNodeLink;
            }
            tempNodePtr->nextNodeLink = currentNodePtr;
            currentNodePtr->nextNodeLink = NULL;
            printf("\nContact Created Successfully");
        }
    }
}

void createContact()
{
    struct node *currentNodePtr, *tempNodePtr;
    currentNodePtr = (struct node *)malloc(sizeof(struct node));
    char name[25];
    char phone[11];
    if (currentNodePtr == NULL)
    {
        printf("\nCan't Allocate Memory");
    }
    else
    {
        fflush(stdin);
        printf("Enter Name: ");
        fflush(stdin);
        gets(name);
        fflush(stdin);
        printf("Enter Phone: ");
        fflush(stdin);
        gets(phone);
        fflush(stdin);

        strcpy(currentNodePtr->name, name);
        strcpy(currentNodePtr->phone, phone);

        if (head == NULL)
        {
            currentNodePtr->nextNodeLink = NULL;
            head = currentNodePtr;
            printf("\nContact Created Successfully");
        }
        else
        {
            tempNodePtr = head;
            while (tempNodePtr->nextNodeLink != NULL)
            {
                tempNodePtr = tempNodePtr->nextNodeLink;
            }
            tempNodePtr->nextNodeLink = currentNodePtr;
            currentNodePtr->nextNodeLink = NULL;
            printf("\nContact Created Successfully");
        }
    }
}

void deleteContact()
{
    printf("delete lol");
}

void searchContact()
{
    printf("search lol");
    // struct node *currentNodePtr;
    // currentNodePtr = head;
    // char search[25];
    // if (currentNodePtr != NULL)
    // {
    //     printf("\nEnter Phone Number or Name to Search: ");
    //     fgets(search, nameLimit, stdin);
    //     fflush(stdin);
    //     if (strlen(search) == phoneLimit + 1)
    //     {
    //         printf("Searching for Phone Number: %s", search);
    //         while (currentNodePtr != NULL)
    //         {
    //         }
    //     }
    // }
    // else
    // {
    //     printf("\nList is Empty !!");
    // }
}

void showAllContacts()
{
    struct node *currentNodePtr;
    currentNodePtr = head;

    if (currentNodePtr != NULL)
    {
        printf("\nShowing All Contacts...\n");
        printf("\nPhone Number Name\n");
        while (currentNodePtr != NULL)
        {
            printf("\n%s\t%s", currentNodePtr->phone, currentNodePtr->name);
            currentNodePtr = currentNodePtr->nextNodeLink;
            // char phone[phoneLimit] = currentNodePtr->phone;
            // char name[nameLimit] = currentNodePtr->name;
            // printf("%s - %s",phone,name);
            // puts(currentNodePtr->phone);
            // puts(currentNodePtr->name);
        }
    }
    else
    {
        printf("\nNo Contacts Found !!");
    }
}

/*
void createContact()
{
    struct node *currentNodePtr;
    currentNodePtr = (struct node *)malloc(sizeof(struct node *));
    char name[nameLimit], phone[phoneLimit];
    if (currentNodePtr != NULL)
    {
        fflush(stdin);
        printf("Enter Name: ");
        fflush(stdin);
        fgets(name, nameLimit, stdin);
        fflush(stdin);

        printf("Enter Phone: ");
        fflush(stdin);
        fgets(phone, phoneLimit, stdin);
        fflush(stdin);

        strcpy(currentNodePtr->name, name);
        strcpy(currentNodePtr->phone, phone);
        currentNodePtr->nextNodeLink = head;
        head = currentNodePtr;
        printf("\nContact Created Successfully");
    }
    else
    {
        printf("\nCan't Allocate Memory");
    }
    // free(nodePtr);
    // nodePtr = NULL;
}
*/