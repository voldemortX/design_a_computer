#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<conio.h>  //getch()���� 
#include<windows.h>
#include<conio.h>

#define MAXVEX 6
#define INFINITY 65535

//���ṹ�壩������źͳ����� 
struct city
{
	int number;
	char name[10];    
};
struct city cityinfo[MAXVEX];  //����ṹ����� 

//���ṹ�壩ͼ�Ľ��� 
typedef char VertexType;  //�������� 
typedef int EdgeType;  //����Ȩֵ���� 
typedef struct matrix    
{
	int numVertexes,numEdges;  //ͼ�ж������ͱ��� 
	VertexType vertex[MAXVEX];//�����������������   
	EdgeType disedge[MAXVEX][MAXVEX],timedge[MAXVEX][MAXVEX],cosedge[MAXVEX][MAXVEX];   //�ڽӾ�������Ȩֵ�ֱ��ʾ���룬ʱ�䣬����
};  //���������ﶨ��ýṹ��ָ�� 

//����������ͼ���г�ʼ������ʼȫ��Ϊ0��
void initiate(struct matrix *G,int numVertexes)   //*G��stone�ṹ����ָ�� 
{  
	int i,j;
	for(i=0;i<numVertexes;i++)
		for(j=0;j<numVertexes;j++)
			G->timedge[i][j]=G->cosedge[i][j]=G->disedge[i][j]=0;  //ͨ��i��j������ѭ���������ڽӾ����ʼ��Ϊ0 
}

//�������� ��ȡ�ļ������������ڽӾ��� 
void create(struct matrix *G)   
{  

	FILE *fp;  //����fp��ָ�룬����ָ��FILE���͵Ķ���
	fp=fopen("��ͨ����.txt","r");  //fopen��׼�������򿪴����ļ�ʵϰ��ͨ����.txt�� ���ڶ����ͷ�ָ�룬ָ��FILE���Ͷ���
	if(fp==NULL)
		printf("�޷��򿪸��ļ�!");
	else
	{
     fscanf(fp,"%d  %d",&(G->numVertexes),&(G->numEdges));  //���ļ����룺���и��������������ͳ��м��·������������ 
	 int i=0,j=0;
	 for(i=0;i<(G->numVertexes);i++)
	 {
		 fscanf(fp,"%d",&G->vertex[i]);   //���ļ��ж��룺�������
		 cityinfo[i].number=G->vertex[i]; 
		 fscanf(fp,"%s",cityinfo[i].name);   //���ļ��ж��룺��������
	 }
	 initiate(G,G->numVertexes);   //��ʼ��
	 //�����ǰѳ��е������Ϣ������ͼ����ʽ����ͼ��
	 for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->disedge[i][j]));    //���м����̾���
    for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->timedge[i][j]));    //���м�����ʱ��
    for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->cosedge[i][j]));    //���м�����ٷ���
	}
}


//��������ͨ��������Ų�ѯ�������֣����������ţ����س������֣� 
char  *getname(int i)  //����ֵΪchar���ͣ�����ֵΪint����  (char*�����ַ����洢����Ϊָ��ĵ�ַ��ջ) 
{   
	if(i<0||i>MAXVEX)
	{
		printf("���������������ȷ�ĳ�����ţ�");
		exit (-1);  //�˳�������Ĳ����ǳ����˳�ʱ��״̬�룬0��ʾ�����˳���������ʾ�������˳�
	}
    return cityinfo[i-1].name;  //���س������� 
}

//��������ͨ���������ֲ�ѯ���к��루����������֣����س�����ţ� 
int getnumber(char cityname[])  //����char���ͣ�����int���� 
{   
	int i;
	for(i=0;i<MAXVEX;i++)
    {
		if(strcmp(cityinfo[i].name,cityname)==0)  //�Ƚ�����ĳ������������еĳ������� �������ַ�����ͬ������·���ֵΪ0�� 
			return (cityinfo[i].number);  //���س������ 
	}
	printf("������ĳ������� :%s�д���! ",cityname);
	return -1;  //����һ������ֵ������ʧ�ܣ�����0��ʾ����������������0��ʾ�쳣������ 
}
 
//��������Floyd�㷨 
//Floyd�㷨������ͼG�и�����v�����ඥ��w���·��P[v][w]����Ȩ����D[v][w] 
void ShortestPath_Floyd(int Pathmatirx[MAXVEX][MAXVEX], int ShortPathTable[MAXVEX][MAXVEX],int Transit[MAXVEX][MAXVEX])
{
     int i,j,k;
     for(i=0; i<6; ++i)     //��ʼ��D��P ,numVertexesΪ������ 
     {
     	for(j=0;j<6; ++j)
     	{
	      	ShortPathTable[i][j]=Transit[i][j];  //D[v][w]ֵ��Ϊ��Ӧ���Ȩֵ 
        	Pathmatirx[i][j]=j;  //��ʼ��P 
	    }
	 }
     for(k=0; k<6; ++k)
     {
     	for(i=0; i<6; ++i)
     	{
     		for(j=0; j<6; ++j)
     		{
     			if(ShortPathTable[i][j]>ShortPathTable[i][k]+ShortPathTable[k][j])  //��������±�ΪK����·����ԭ�����·�����̣�����ǰ�����Ȩֵ��Ϊ��С��һ��
     			{
     				ShortPathTable[i][j]=ShortPathTable[i][k]+ShortPathTable[k][j];
     				Pathmatirx[i][j]=Pathmatirx[i][k];  //·�����þ����±�Ϊk�Ķ��� 
				 }
			 }
		 }
	 }
}

//�������� ��ʾ��������֮������·�� 
void otominpath(struct matrix *G)
{
	system("cls");  //���� 
    printf("��������ż�����:\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
     printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
     if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
    printf("\n");   
	int a,b; 
    char cityname1[MAXVEX];   
	char cityname2[MAXVEX];  //���������������ֱ��� 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("�������������е�����(������):\n");
	printf("����1:");
	scanf("%s",cityname1);
	printf("����2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //����һ����������ת��Ϊ������� 
	b=getnumber(cityname2);  //���ڶ�����������ת��Ϊ�������
	while(a==-1||b==-1)  //�������ĳ��������޶�Ӧ��ţ�����ʾ������� 
	{
		printf("���������Ч�������������������е�����(������):");
		printf("����1:");
		scanf("%s",cityname1);
		printf("����2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPath_Floyd(Pathmatirx,ShortPathTable,G->disedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("��%s��%s�����·��Ϊ:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("·��Ϊ:%s<-",cityname2);
			 int x=Pathmatirx[a-1][b-1];
			 while(x!=-1)
			 {
				 printf("%s<-",getname(x));
				 x=Pathmatirx[a-1][x];
			 }
			 printf("%s\n",cityname1);
		 }
		 else
			 printf("\n");
	 }
	 else
		 printf("%s��%s֮�䲻�ɴ�!",cityname1,cityname2);
	 printf("�����������.....");
	 getch();
system("cls"); 
}

//����������ʾ��������֮�������ʱ�� 
void otomincost(struct matrix *G)
{
	system("cls");  //���� 
    printf("��������ż�����:\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
     printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
     if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
    printf("\n");   
	int a,b; 
    char cityname1[MAXVEX];   
	char cityname2[MAXVEX];  //���������������ֱ��� 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("�������������е�����(������):\n");
	printf("����1:");
	scanf("%s",cityname1);
	printf("����2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //����һ����������ת��Ϊ������� 
	b=getnumber(cityname2);  //���ڶ�����������ת��Ϊ�������
	while(a==-1||b==-1)  //�������ĳ��������޶�Ӧ��ţ�����ʾ������� 
	{
		printf("���������Ч�������������������е�����(������):");
		printf("����1:");
		scanf("%s",cityname1);
		printf("����2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPath_Floyd(Pathmatirx,ShortPathTable,G->timedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("��%s��%s�����·��Ϊ:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("·��Ϊ:%s<-",cityname2);
			 int x=Pathmatirx[a-1][b-1];
			 while(x!=-1)
			 {
				 printf("%s<-",getname(x));
				 x=Pathmatirx[a-1][x];
			 }
			 printf("%s\n",cityname1);
		 }
		 else
			 printf("\n");
	 }
	 else
		 printf("%s��%s֮�䲻�ɴ�!",cityname1,cityname2);
	 printf("�����������.....");
	 getch();
system("cls");	 
}

//����������ʾ��������֮������ٷ��� 
void otomintime(struct matrix *G)
{
	system("cls");  //���� 
    printf("��������ż�����:\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
     printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
     if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
    printf("\n");   
	int a,b; 
    char cityname1[MAXVEX];   
	char cityname2[MAXVEX];  //���������������ֱ��� 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("�������������е�����(������):\n");
	printf("����1:");
	scanf("%s",cityname1);
	printf("����2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //����һ����������ת��Ϊ������� 
	b=getnumber(cityname2);  //���ڶ�����������ת��Ϊ�������
	while(a==-1||b==-1)  //�������ĳ��������޶�Ӧ��ţ�����ʾ������� 
	{
		printf("���������Ч�������������������е�����(������):");
		printf("����1:");
		scanf("%s",cityname1);
		printf("����2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPatht_Floyd(Pathmatirx,ShortPathTable,G->cosedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("��%s��%s�����·��Ϊ:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("·��Ϊ:%s<-",cityname2);
			 int x=Pathmatirx[a-1][b-1];
			 while(x!=-1)
			 {
				 printf("%s<-",getname(x));
				 x=Pathmatirx[a-1][x];
			 }
			 printf("%s\n",cityname1);
		 }
		 else
			 printf("\n");
	 }
	 else
		 printf("%s��%s֮�䲻�ɴ�!",cityname1,cityname2);
	 printf("�����������.....");
	 getch();
system("cls");	 
}


//��������Dijkstra�㷨 
typedef int Patharc[MAXVEX];
typedef int ShortPath[MAXVEX];
typedef int transit[MAXVEX][MAXVEX];

void ShortestPath_Dijkstra(int v0, int Patharc[MAXVEX], int ShortPath[MAXVEX], int transit[MAXVEX][MAXVEX])
{
	int i,j,k,min;
	int final[MAXVEX];  //final[w]=1��ʾ��ö���v0��vw�����·�� 
	for(i=0; i<6; i++)  //��ʼ������ 
	{
		final[i]=0;  //ȫ�������ʼ��Ϊδ֪���·��״̬ 
		ShortPath[i]=transit[v0][i];  //����v0�������ߵĶ������Ȩֵ 
		Patharc[i]=0;   //��ʼ��·������PΪ0 
	}
	ShortPath[v0]=0;  //v0��v0·��Ϊ0 
	final[v0]=1;  //v0��v0����Ҫ��·�� 
	for(i=1; i<6; i++)
	{
		min=INFINITY;
		for(j=0; j<6; j++)
		{
			if(!final[j] && ShortPath[j]<min)
			{
				k=j;
				min=ShortPath[j];  //w������v0������� 
			}
		}
		final[k]=1;  //��Ŀǰ�ҵ�������Ķ�����Ϊ1 
		for(j=0; j<6; j++)  //������ǰ���·�������� 
		{
			if(!final[j] && (min+transit[k][j]<ShortPath[j]))  //�������v�����·������������·���ĳ��ȶ̵Ļ� 
			{  //˵���ҵ��˸��̵�·�����޸�D[w]��P[w] 
				ShortPath[j]=min+transit[k][j];  //�޸ĵ�ǰ·������ 
				Patharc[j]=k;
			 } 
		}
	}
}
//����������ʾһ�����е��������е����·��
void otaminpath(struct matrix *G)
{   
	system("cls");
	printf("�ɶ����¸�����(��ż�������):\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
	 printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
	 if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
	char cityname[MAXVEX];
    int ShortPath[MAXVEX];
	int Patharc[MAXVEX];
	printf("��������ʼ�ĳ�������(������):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->disedge);
	printf("��%s��㵽����������̾���Ϊ:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("�����%s����̾���Ϊ%d:\n",getname(i+1),ShortPath[i]);
		printf("�ӽ��%s������������·����ǰһ�����Ϊ:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("�����%s��ǰһ�����Ϊ%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("�����������......");
			getch();
			system("cls");
}

//����������ʾһ�����е��������е����ʱ�� 
void otamintime(struct matrix *G)
{   
	system("cls");
	printf("�ɶ����¸�����(��ż�������):\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
	 printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
	 if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
	char cityname[MAXVEX];
    int ShortPath[MAXVEX];
	int Patharc[MAXVEX];
	printf("��������ʼ�ĳ�������(������):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->timedge);
	printf("��%s��㵽�����������ʱ��Ϊ:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("�����%s�����ʱ��Ϊ%d:\n",getname(i+1),ShortPath[i]);
		printf("�ӽ��%s������������ʱ��·����ǰһ�����Ϊ:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("�����%s��ǰһ�����Ϊ%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("�����������......");
			getch();
			system("cls");
}

//����������ʾһ�����е��������е����·��
void otamincost(struct matrix *G)
{   
	system("cls");
	printf("�ɶ����¸�����(��ż�������):\n");
	int i;
	for(i=0;i<G->numVertexes;i++)
	{
	 printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
	 if((i+1)%5==0)
	 printf("\n");
	}
	printf("\n\n");
	char cityname[MAXVEX];
    int ShortPath[MAXVEX];
	int Patharc[MAXVEX];
	printf("��������ʼ�ĳ�������(������):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->cosedge);
	printf("��%s��㵽����������̾���Ϊ:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("�����%s����̾���Ϊ%d:\n",getname(i+1),ShortPath[i]);
		printf("�ӽ��%s������������·����ǰһ�����Ϊ:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("�����%s��ǰһ�����Ϊ%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("�����������......");
			getch();
			system("cls");
}

//���������޸����� 
int changekey()
{
     
    char key[20]="123456";//��ʼ���� 
    char temp_key[20],temp_key1[20],temp_key2[20];//�����ַ������룬ԭʼ���룬������1��������2
    printf("������ԭ�������룺");
    loop:scanf("%s",temp_key);
    while(1)
    {
        
            /*ע��strcmp������string.hͷ�ļ����棬��Ҫ���� */
    if(strcmp(temp_key,key)==0)//��ԭʼ����Ա���֤ 
    {
        printf("\t������ȷ��\n"); 
        printf("\t�����������룺\n");
        scanf("%s",temp_key1);
        printf("\t���ٴ��������룺\n");
        scanf("%s",temp_key2);
        if(strcmp(temp_key1,temp_key2)==0)
        {
            printf("�޸�������ȷ��\n���μ�����!");    
            strcpy(key,temp_key1);//���µ��������ɵ�����
            getch();//�ӿ���̨��ȡһ���ַ���������ʾ����Ļ�ϣ�����ͷ�ļ���conio.h��
            break; //����ѭ�����ص���һ��������û���� 
        }
        else
        {
            printf("������������벻һ�£��޸�ʧ�ܣ�\n������ԭ�������룺:");    
            goto loop; //ʵ���û�������������ˣ�������������
            break;
        }
     }
     else
     {
         printf("������������\n������ԭ�������룺");
         goto loop;
        getch();
        break; 
     }
     } 
 
}

//(�������û���¼ 
int login()
{
char key[20];
int i;
printf("���������룺\n");
for(i = 0;i < 3;i++)
{
scanf("%s",key);
if(strcmp(key,"123456") == 0)
{
   break;
}
else
{
printf("�����������������(ʣ��%d�λ���)��\n",2-i);
}
}
if(i == 3)
printf("�˳�ϵͳ\n");
else
printf("��¼�ɹ�\n");
return 0;
}

//���������鿴��ǰʱ��
int ViewTime()
{
	system("date/t");
	system("time/t");
	return 0;
}  

 void onetoone(struct matrix *G)	//�������е�һ���ֺ�������ʾ�����м����Ϣ
{
	system("cls");
	char flag;
	while(flag!='0')
	{
		printf("��ѡ�����¸����У���Ż����������\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
			if((i+1)%5==0)
			printf("\n");
		}
		printf("\n\n");
    	printf("\t       ��          �������е������Ϣ���д���      ��\n");   
   	 	printf("\t��     ����������������������������������������������\n");   
   		printf("\t       ��          1�������м�����·��           ��\n");
    	printf("\t��     ����������������������������������������������\n");
    	printf("\t       ��          2�������м����Сʱ��           ��\n");
    	printf("\t��     ����������������������������������������������\n");
		printf("\t       ��          3�������м����С����           ��\n");
		printf("\t��     ����������������������������������������������\n");
    	printf("\t       ��          0��������һ���Ӳ˵�             ��\n");
    	printf("����������(1,2,3,0)");
    	scanf("%c",&flag);
    	if(flag=='1')	otominpath(G);
		else if(flag=='2')otomintime(G);
		else if(flag=='3') otomincost(G);
		else if(flag=='0')break;
		else
		{
			printf("���������Ϣ��������������");
			scanf("%d,&flag");
		}
	}
	system("cls");
}

void onetoanother(struct matrix *G)	//�������е�һ���ֺ�������ʾһ���е��������е���Ϣ
{
	system("cls");
	char flag;
	while(flag!='0')
	{
		printf("���������¸�������Ż������:\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s",cityinfo[i].number,cityinfo[i].name);
		}
		   printf("\n\n");
    printf("\n");
	printf("\t��     �q�������������������������������������������r\n");
    printf("\t       ��   ��һ���е��������е������Ϣ���д���   ��\n");   
    printf("\t��     ����������������������������������������������\n");   
    printf("\t       ��       1�����е��������е����·��        ��\n");
    printf("\t��     ����������������������������������������������\n");
    printf("\t       ��       2�����е��������е���Сʱ��        ��\n");
    printf("\t��     ����������������������������������������������\n");
	printf("\t       ��       3�����е��������е���С����        ��\n");
	printf("\t��     ����������������������������������������������\n");
    printf("\t       ��       0��������һ���Ӳ˵�                ��\n");
    printf("\t       �t�������������������������������������������s\n");
    printf("����������(1,2,3,0):");
	scanf("%c",&flag);
	if(flag=='1')	otaminpath(G);
	else if(flag=='2')otamintime(G);
	else if(flag=='3') otamincost(G);
	else if(flag=='0')  break;
	else
	{
		printf("���������!����������:");
	    scanf(" %c",&flag);
	}	 
	}
	system("cls");
}

int main()
{
	struct matrix *G;
	FILE *fp;
	system("title   ȫ����ͨ��ѯϵͳ");	//����ı���
	if((fp=fopen("F:\\��ͨ����.txt","r"))==NULL)
	{
		printf("δ��⵽�ļ����밴y������");
			while(getchar()!='y'||((fp=fopen("F:\\��ͨ����.txt","r"))==NULL))
			printf("�뽫����ͼ�����ŵ�'F:\\��ͨ����.txt',��y����\n"); 
	}

	create (G);	//����ͼ
	char flag;
	while(1)
	{
		printf("���������¸�������Ż������:\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
		}
			printf("\n\n\n");
		 	printf("    \t��������������������������������\n");   
	        printf("    \t��                                                          ��\n");   
	        printf("    \t��              1.��ѯһ�����е��������е���Ϣ              ��\n");   
	        printf("    \t��              2.��ѯ��������֮�����Ϣ                    ��\n");   
	        printf("    \t��              0.�˳�ϵͳ                                  ��\n");   
			printf("    \t��                                                          ��\n"); 
		    printf("    \t��                                                          ��\n");
			printf("    \t��              ��ϵͳ���ṩ���εļƻ�����                  ��\n");
	        printf("    \t��                                                          ��\n");   
	        printf("    \t��������������������������������\n");  
			printf("����������1,2,0");
			scanf("%c",&flag);
			if(flag=='1')  onetoanother(G);
	        else if(flag=='2')  onetoone(G);
			else  if(flag=='0')  break;
	    	else 
			{
				printf("������벻��ȷ!����������:");
	            scanf(" %c",&flag);
			}
	}
}
