#include<stdio.h>
#define LIMIT 100001


int n,a[LIMIT];
//b reprezinta spatiul solutiilor partiale
int b[LIMIT],maxi;
FILE * out;
void read();
void write();
void scmax();
int recurs(int maxi,int q);

int main()
{
    read();
    maxi = 1;
    b[1] = 1;
    scmax();
    write();

return 0;

}
void read()
{
    FILE * pFile;
    int i;

    pFile = fopen ("scmax.in","r+");
    fscanf (pFile, "%d", &n);
    for( i = 1; i <= n; i++)
     fscanf (pFile, "%d", &a[i]);

    fclose (pFile);
}

void write()
{
	//maxi reprezinta lungimea maxima
    fprintf(out,"%d ",maxi);
    //TO Do
    //decomentati linia de mai jos pentru a afisa recursiv sirul
    recurs(maxi,n);
    fclose(out);
}

int searchbsol(int k){
    int low = 1, high = k - 1, mid;
    
    while (low <= high) {
        mid = (low + high) / 2;
        
        if (a[mid] < a[k]) {
            if (a[mid + 1] < a[k])
                low = mid + 1;
            else
                return mid + 1;
        } else {
            high = mid - 1;
        }
    }
    
    return 0;
}
void scmax(){
     for(int i = 2; i <= n; i++)
     {
             b[i] = searchbsol(i);
             if(b[i] > maxi)
             maxi = b[i];
     }
}
int recurs(int maxi,int q){
     if(q == 0)return 0;
     else
     if(b[q] == maxi)
     {
             recurs(maxi-1,q-1);
             fprintf(out, "%d",a[q]);
     }
     else recurs(maxi,q-1);
}
