#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define NULL ((void*)0)
#define nameLimit 25
#define phoneLimit 11

struct node
{
    char name[nameLimit];
    char phone[phoneLimit];
    struct node *nextNodeLink;
};

struct node *head = NULL;

void createContact();
void searchContact();
void deleteContact();
void showAllContacts();

int main(int argc, char const *argv[])
{
    int option;
    do
    {
        printf("\n\n\n------------Main Menu------------");
        printf("\nChoose one option from the following list..");
        printf("\n0 = Exit :(\n1 = Create New Contact");
        printf("\n2 = Search A Contact\n3 = Delete A Contact");
        printf("\n4 = Show All Contacts\n");
        printf("\nEnter your choice: ");
        scanf("%d", &option);
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
            searchContact();
            break;
        case 3:
            deleteContact();
            break;
        case 4:
            showAllContacts();
            break;
        default:
            printf("Please Enter A Valid Choice..");
        }
    } while (option != 0);

    return 0;
}

void createContact()
{
    struct node *currentNodePtr, *tempNodePtr;
    currentNodePtr = (struct node *)malloc(sizeof(struct node));
    char name[nameLimit], phone[phoneLimit];
    if (currentNodePtr == NULL)
    {
        printf("\nCan't Allocate Memory");
        return;
    }

    fflush(stdin);
    printf("Enter Name: ");
    fgets(name, nameLimit, stdin);
    fflush(stdin);
    printf("Enter Phone: ");
    fgets(phone, phoneLimit, stdin);
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

void deleteContact()
{
    struct node *previousNodePtr, *currentNodePtr;
    currentNodePtr = head;
    if (currentNodePtr == NULL)
    {
        printf("\nContact List is Empty !!");
        return;
    }

    char delNumber[phoneLimit];
    printf("\nEnter Phone Number to Delete: ");
    fgets(delNumber, phoneLimit, stdin);
    fflush(stdin);
    delNumber[strlen(delNumber) - 1] = '\000';

    while (currentNodePtr != NULL)
    {
        if (strncmp(currentNodePtr->phone, delNumber, strlen(delNumber)) == 0)
        {
            printf("Contact Deleted: %s\t%s", currentNodePtr->phone, currentNodePtr->name);
            previousNodePtr->nextNodeLink = currentNodePtr->nextNodeLink;
            free(currentNodePtr);
            currentNodePtr = NULL;
            break;
        }
        previousNodePtr = currentNodePtr;
        currentNodePtr = currentNodePtr->nextNodeLink;
    }
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

    char search[strlen(searchInput)];
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
            //printf("\nTest: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name); // for debug
            if (strncmp(currentNodePtr->phone, search, strlen(search)) == 0)
            {
                printf("\nContact Found: ");
                printf("%s -- %s", currentNodePtr->phone, currentNodePtr->name);
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
            //printf("\nTest: '%s'\t'%s'", currentNodePtr->phone, currentNodePtr->name); // for debug
            if (strncmp(currentNodePtr->name, search, strlen(search)) == 0)
            {
                printf("\nContact Found: ");
                printf("%s -- %s", currentNodePtr->phone, currentNodePtr->name);
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
        printf("------------------------");
        printf("\n|   Number   |   Name   |");
        printf("\n------------------------");
        while (currentNodePtr != NULL)
        {
            printf("\n| %s | %s", currentNodePtr->phone, currentNodePtr->name);
            currentNodePtr = currentNodePtr->nextNodeLink;
        }
        printf("\n------------------------");
    }
    else
    {
        printf("\nNo Contacts Found !!");
    }
}

/*
void deleteAllContacts();

void deleteAllContacts()
{
    struct node *currentNodePtr;
    currentNodePtr = head;
    if (currentNodePtr == NULL)
    {
        printf("\nContact List is Empty !!");
        return;
    }

    printf("Deleting All Contacts and Exiting..");
    while (head != NULL)
    {
        currentNodePtr = head;
        head = head->nextNodeLink;
        free(currentNodePtr);
    }
}
*/

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