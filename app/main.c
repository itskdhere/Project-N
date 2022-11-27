#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <process.h>
#include <string.h>

//#define NULL ((void*)0)
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
    struct node *currentNodePtr;
    currentNodePtr = head;
    if (currentNodePtr == NULL)
    {
        printf("\nContact List is Empty !!");
        return;
    }

    char searchInput[nameLimit];
    printf("\nEnter Phone Number or Name to Search: ");
    fgets(searchInput, nameLimit, stdin);
    fflush(stdin);

    char search[strlen(searchInput)]; // HERE
    strcpy(search, searchInput);
    search[strlen(searchInput) - 1] = '\000';
    int searchType = 0; // 0=Number, 1=Name
    int contactFound = 1;
    char ch;
    for (int i = 0; i < strlen(search); i++)
    {
        for (ch = 0x30; ch < 0x39; ch++)
        {
            if (search[i] == ch)
            {
                searchType = 0;
                break;
            }
            else
                searchType = 1;
        }
    }

    if (searchType == 0)
    {
        printf("Searching for Phone Number: '%s'", search);
        // search[strlen(search) - 1] = '\000';
        while (currentNodePtr != NULL)
        {
            printf("\nTest: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name); // for debug
            if (strncmp(currentNodePtr->phone, search, strlen(search)) == 0)
            {
                printf("\nContact Found: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name);
                // printf("\n%s\t%s", currentNodePtr->phone, currentNodePtr->name);
                contactFound = 1;
            }
            else
            {
                contactFound = 0;
            }
            currentNodePtr = currentNodePtr->nextNodeLink;
        }
        if (contactFound == 0)
        {
            printf("\nContact NOT Found");
        }
    }
    else if (searchType == 1)
    {
        printf("Searching for Name: '%s'", search);
        // search[strlen(search) - 1] = '\000';
        while (currentNodePtr != NULL)
        {
            printf("\nTest: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name); // for debug
            if (strncmp(currentNodePtr->name, search, strlen(search)) == 0)
            {
                printf("\nContact Found: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name);
                // printf("\n%s\t%s", currentNodePtr->phone, currentNodePtr->name);
                contactFound = 1;
            }
            else
            {
                contactFound = 0;
            }
            currentNodePtr = currentNodePtr->nextNodeLink;
        }
        if (contactFound == 0)
        {
            printf("\nContact NOT Found");
        }
    }
    else
        printf("Error !");
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
        }
    }
    else
    {
        printf("\nNo Contacts Found !!");
    }
}

/* for (ch = 0x30; ch < 0x39; ch++) // 0x30 = '0' and 0x39 = '9'
    {
        chPtr = strchr(search, ch);
        if (chPtr == NULL)
            searchType = 1; // Searching for Name
        else
            searchType = 0;
    } */

/*
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
*/

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