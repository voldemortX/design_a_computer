#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<conio.h>  //getch()函数 
#include<windows.h>
#include<conio.h>

#define MAXVEX 6
#define INFINITY 65535

//（结构体）城市序号和城市名 
struct city
{
	int number;
	char name[10];    
};
struct city cityinfo[MAXVEX];  //定义结构体变量 

//（结构体）图的建立 
typedef char VertexType;  //顶点类型 
typedef int EdgeType;  //边上权值类型 
typedef struct matrix    
{
	int numVertexes,numEdges;  //图中顶点数和边数 
	VertexType vertex[MAXVEX];//顶点表，顶点数，边数   
	EdgeType disedge[MAXVEX][MAXVEX],timedge[MAXVEX][MAXVEX],cosedge[MAXVEX][MAXVEX];   //邻接矩阵，其中权值分别表示距离，时间，费用
};  //在主函数里定义该结构体指针 

//（函数）对图进行初始化（开始全部为0）
void initiate(struct matrix *G,int numVertexes)   //*G是stone结构体中指针 
{  
	int i,j;
	for(i=0;i<numVertexes;i++)
		for(j=0;j<numVertexes;j++)
			G->timedge[i][j]=G->cosedge[i][j]=G->disedge[i][j]=0;  //通过i和j的两重循环将三个邻接矩阵初始化为0 
}

//（函数） 读取文件，创建三个邻接矩阵 
void create(struct matrix *G)   
{  

	FILE *fp;  //声明fp是指针，用来指向FILE类型的对象
	fp=fopen("交通数据.txt","r");  //fopen标准函数，打开磁盘文件实习交通数据.txt， 用于读、送返指针，指向FILE类型对象
	if(fp==NULL)
		printf("无法打开该文件!");
	else
	{
     fscanf(fp,"%d  %d",&(G->numVertexes),&(G->numEdges));  //从文件读入：城市个数（顶点数）和城市间的路径数（边数） 
	 int i=0,j=0;
	 for(i=0;i<(G->numVertexes);i++)
	 {
		 fscanf(fp,"%d",&G->vertex[i]);   //从文件中读入：城市序号
		 cityinfo[i].number=G->vertex[i]; 
		 fscanf(fp,"%s",cityinfo[i].name);   //从文件中读入：城市名字
	 }
	 initiate(G,G->numVertexes);   //初始化
	 //下面是把城市的相关信息以三个图的形式放入图中
	 for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->disedge[i][j]));    //城市间的最短距离
    for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->timedge[i][j]));    //城市间的最短时间
    for(i=0;i<(G->numVertexes);i++)
		 for(j=0;j<(G->numVertexes);j++)
			 fscanf(fp,"%d",&(G->cosedge[i][j]));    //城市间的最少费用
	}
}


//（函数）通过城市序号查询城市名字（输入城市序号，返回城市名字） 
char  *getname(int i)  //返回值为char类型，输入值为int类型  (char*代表字符串存储，作为指针的地址入栈) 
{   
	if(i<0||i>MAXVEX)
	{
		printf("输入错误，请输入正确的城市序号！");
		exit (-1);  //退出，传入的参数是程序退出时的状态码，0表示正常退出，其他表示非正常退出
	}
    return cityinfo[i-1].name;  //返回城市名字 
}

//（函数）通过城市名字查询城市号码（输入城市名字，返回城市序号） 
int getnumber(char cityname[])  //输入char类型，返回int类型 
{   
	int i;
	for(i=0;i<MAXVEX;i++)
    {
		if(strcmp(cityinfo[i].name,cityname)==0)  //比较输入的城市名字与已有的城市名字 （两个字符串相同的情况下返回值为0） 
			return (cityinfo[i].number);  //返回城市序号 
	}
	printf("您输入的城市名字 :%s有错误! ",cityname);
	return -1;  //返回一个代数值，函数失败（返回0表示函数正常结束，非0表示异常结束） 
}
 
//（函数）Floyd算法 
//Floyd算法，求网图G中各顶点v到其余顶点w最短路径P[v][w]及带权长度D[v][w] 
void ShortestPath_Floyd(int Pathmatirx[MAXVEX][MAXVEX], int ShortPathTable[MAXVEX][MAXVEX],int Transit[MAXVEX][MAXVEX])
{
     int i,j,k;
     for(i=0; i<6; ++i)     //初始化D与P ,numVertexes为顶点数 
     {
     	for(j=0;j<6; ++j)
     	{
	      	ShortPathTable[i][j]=Transit[i][j];  //D[v][w]值即为对应点的权值 
        	Pathmatirx[i][j]=j;  //初始化P 
	    }
	 }
     for(k=0; k<6; ++k)
     {
     	for(i=0; i<6; ++i)
     	{
     		for(j=0; j<6; ++j)
     		{
     			if(ShortPathTable[i][j]>ShortPathTable[i][k]+ShortPathTable[k][j])  //如果经过下标为K顶点路径比原两点间路径更短，将当前两点间权值设为更小的一个
     			{
     				ShortPathTable[i][j]=ShortPathTable[i][k]+ShortPathTable[k][j];
     				Pathmatirx[i][j]=Pathmatirx[i][k];  //路径设置经过下标为k的顶点 
				 }
			 }
		 }
	 }
}

//（函数） 显示两个城市之间的最短路径 
void otominpath(struct matrix *G)
{
	system("cls");  //清屏 
    printf("各城市序号及名字:\n");
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
	char cityname2[MAXVEX];  //定义两个城市名字变量 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("请输入两个城市的名字(中文名):\n");
	printf("城市1:");
	scanf("%s",cityname1);
	printf("城市2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //将第一个城市名字转化为城市序号 
	b=getnumber(cityname2);  //将第二个城市名字转化为城市序号
	while(a==-1||b==-1)  //如果输入的城市名字无对应序号，则提示输入错误 
	{
		printf("输入城市无效，请重新输入两个城市的名字(中文名):");
		printf("城市1:");
		scanf("%s",cityname1);
		printf("城市2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPath_Floyd(Pathmatirx,ShortPathTable,G->disedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("从%s到%s的最短路径为:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("路径为:%s<-",cityname2);
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
		 printf("%s和%s之间不可达!",cityname1,cityname2);
	 printf("按任意键返回.....");
	 getch();
system("cls"); 
}

//（函数）显示两个城市之间的最少时间 
void otomincost(struct matrix *G)
{
	system("cls");  //清屏 
    printf("各城市序号及名字:\n");
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
	char cityname2[MAXVEX];  //定义两个城市名字变量 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("请输入两个城市的名字(中文名):\n");
	printf("城市1:");
	scanf("%s",cityname1);
	printf("城市2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //将第一个城市名字转化为城市序号 
	b=getnumber(cityname2);  //将第二个城市名字转化为城市序号
	while(a==-1||b==-1)  //如果输入的城市名字无对应序号，则提示输入错误 
	{
		printf("输入城市无效，请重新输入两个城市的名字(中文名):");
		printf("城市1:");
		scanf("%s",cityname1);
		printf("城市2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPath_Floyd(Pathmatirx,ShortPathTable,G->timedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("从%s到%s的最短路径为:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("路径为:%s<-",cityname2);
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
		 printf("%s和%s之间不可达!",cityname1,cityname2);
	 printf("按任意键返回.....");
	 getch();
system("cls");	 
}

//（函数）显示两个城市之间的最少费用 
void otomintime(struct matrix *G)
{
	system("cls");  //清屏 
    printf("各城市序号及名字:\n");
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
	char cityname2[MAXVEX];  //定义两个城市名字变量 
	int ShortPathTable[MAXVEX][MAXVEX];
	int Pathmatirx[MAXVEX][MAXVEX];
	printf("请输入两个城市的名字(中文名):\n");
	printf("城市1:");
	scanf("%s",cityname1);
	printf("城市2:");
	scanf("%s",cityname2);
    a=getnumber(cityname1);  //将第一个城市名字转化为城市序号 
	b=getnumber(cityname2);  //将第二个城市名字转化为城市序号
	while(a==-1||b==-1)  //如果输入的城市名字无对应序号，则提示输入错误 
	{
		printf("输入城市无效，请重新输入两个城市的名字(中文名):");
		printf("城市1:");
		scanf("%s",cityname1);
		printf("城市2:");
		scanf("%s",cityname2);
		a=getnumber(cityname1);
		b=getnumber(cityname2); 
	}
     ShortestPatht_Floyd(Pathmatirx,ShortPathTable,G->cosedge);
	 if(ShortPathTable[a-1][b-1]!=INFINITY)
	 {
		 printf("从%s到%s的最短路径为:%d\n",cityname1,cityname2,ShortPathTable[a-1][b-1]);
		 if(Pathmatirx[a-1][b-1]!=-1)
		 {
			 printf("路径为:%s<-",cityname2);
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
		 printf("%s和%s之间不可达!",cityname1,cityname2);
	 printf("按任意键返回.....");
	 getch();
system("cls");	 
}


//（函数）Dijkstra算法 
typedef int Patharc[MAXVEX];
typedef int ShortPath[MAXVEX];
typedef int transit[MAXVEX][MAXVEX];

void ShortestPath_Dijkstra(int v0, int Patharc[MAXVEX], int ShortPath[MAXVEX], int transit[MAXVEX][MAXVEX])
{
	int i,j,k,min;
	int final[MAXVEX];  //final[w]=1表示求得顶点v0到vw的最短路径 
	for(i=0; i<6; i++)  //初始化数据 
	{
		final[i]=0;  //全部顶点初始化为未知最短路径状态 
		ShortPath[i]=transit[v0][i];  //将与v0点有连线的顶点加上权值 
		Patharc[i]=0;   //初始化路径数组P为0 
	}
	ShortPath[v0]=0;  //v0至v0路径为0 
	final[v0]=1;  //v0至v0不需要求路径 
	for(i=1; i<6; i++)
	{
		min=INFINITY;
		for(j=0; j<6; j++)
		{
			if(!final[j] && ShortPath[j]<min)
			{
				k=j;
				min=ShortPath[j];  //w顶点离v0顶点更近 
			}
		}
		final[k]=1;  //将目前找到的最近的顶点置为1 
		for(j=0; j<6; j++)  //修正当前最短路径及距离 
		{
			if(!final[j] && (min+transit[k][j]<ShortPath[j]))  //如果经过v顶点的路径比现在这条路径的长度短的话 
			{  //说明找到了更短的路径，修改D[w]和P[w] 
				ShortPath[j]=min+transit[k][j];  //修改当前路径长度 
				Patharc[j]=k;
			 } 
		}
	}
}
//（函数）显示一个城市到其他城市的最短路径
void otaminpath(struct matrix *G)
{   
	system("cls");
	printf("可对以下各城市(序号及城市名):\n");
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
	printf("请输入起始的城市名字(中文名):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->disedge);
	printf("从%s结点到其他结点的最短距离为:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("到结点%s的最短距离为%d:\n",getname(i+1),ShortPath[i]);
		printf("从结点%s到其他结点最短路径的前一个结点为:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("到结点%s的前一个结点为%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("按任意键返回......");
			getch();
			system("cls");
}

//（函数）显示一个城市到其他城市的最短时间 
void otamintime(struct matrix *G)
{   
	system("cls");
	printf("可对以下各城市(序号及城市名):\n");
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
	printf("请输入起始的城市名字(中文名):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->timedge);
	printf("从%s结点到其他结点的最短时间为:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("到结点%s的最短时间为%d:\n",getname(i+1),ShortPath[i]);
		printf("从结点%s到其他结点最短时间路径的前一个结点为:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("到结点%s的前一个结点为%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("按任意键返回......");
			getch();
			system("cls");
}

//（函数）显示一个城市到其他城市的最短路径
void otamincost(struct matrix *G)
{   
	system("cls");
	printf("可对以下各城市(序号及城市名):\n");
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
	printf("请输入起始的城市名字(中文名):");
	scanf("%s",cityname);
    int a;
	a=getnumber(cityname)-1;
    ShortestPath_Dijkstra(a,ShortPath,Patharc,G->cosedge);
	printf("从%s结点到其他结点的最短距离为:\n",cityname);
	for(i=0;i<G->numVertexes;i++)
	    printf("到结点%s的最短距离为%d:\n",getname(i+1),ShortPath[i]);
		printf("从结点%s到其他结点最短路径的前一个结点为:\n",getname(1));
		for(i=0;i<G->numVertexes;i++)
			if(Patharc[i]!=-1)
				printf("到结点%s的前一个结点为%s:\n",getname(i+1),getname(Patharc[i]+1));
			printf("按任意键返回......");
			getch();
			system("cls");
}

//（函数）修改密码 
int changekey()
{
     
    char key[20]="123456";//初始密码 
    char temp_key[20],temp_key1[20],temp_key2[20];//三个字符串密码，原始密码，新密码1，新密码2
    printf("请输入原来的密码：");
    loop:scanf("%s",temp_key);
    while(1)
    {
        
            /*注意strcmp函数在string.h头文件里面，需要包含 */
    if(strcmp(temp_key,key)==0)//与原始密码对比验证 
    {
        printf("\t密码正确！\n"); 
        printf("\t请输入新密码：\n");
        scanf("%s",temp_key1);
        printf("\t请再次输入密码：\n");
        scanf("%s",temp_key2);
        if(strcmp(temp_key1,temp_key2)==0)
        {
            printf("修改密码正确！\n请牢记密码!");    
            strcpy(key,temp_key1);//用新的密码代替旧的密码
            getch();//从控制台读取一个字符，但不显示在屏幕上（所在头文件是conio.h）
            break; //跳出循环，回到上一级，这里没体现 
        }
        else
        {
            printf("两次输入的密码不一致！修改失败！\n请输入原来的密码：:");    
            goto loop; //实现用户输出错误密码了，重新输入密码
            break;
        }
     }
     else
     {
         printf("输入的密码错误！\n请输入原来的密码：");
         goto loop;
        getch();
        break; 
     }
     } 
 
}

//(函数）用户登录 
int login()
{
char key[20];
int i;
printf("请输入密码：\n");
for(i = 0;i < 3;i++)
{
scanf("%s",key);
if(strcmp(key,"123456") == 0)
{
   break;
}
else
{
printf("密码错误，请输入密码(剩余%d次机会)：\n",2-i);
}
}
if(i == 3)
printf("退出系统\n");
else
printf("登录成功\n");
return 0;
}

//（函数）查看当前时间
int ViewTime()
{
	system("date/t");
	system("time/t");
	return 0;
}  

 void onetoone(struct matrix *G)	//主函数中的一个分函数，显示两城市间的信息
{
	system("cls");
	char flag;
	while(flag!='0')
	{
		printf("可选择以下各城市（序号或城市名）：\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
			if((i+1)%5==0)
			printf("\n");
		}
		printf("\n\n");
    	printf("\t       ｜          对两城市的相关信息进行处理      ｜\n");   
   	 	printf("\t　     ｜─────────────────────｜\n");   
   		printf("\t       ｜          1、两城市间的最短路径           ｜\n");
    	printf("\t　     ｜─────────────────────｜\n");
    	printf("\t       ｜          2、两城市间的最小时间           ｜\n");
    	printf("\t　     ｜─────────────────────｜\n");
		printf("\t       ｜          3、两城市间的最小费用           ｜\n");
		printf("\t　     ｜─────────────────────｜\n");
    	printf("\t       ｜          0、返回上一个子菜单             ｜\n");
    	printf("请输入数字(1,2,3,0)");
    	scanf("%c",&flag);
    	if(flag=='1')	otominpath(G);
		else if(flag=='2')otomintime(G);
		else if(flag=='3') otomincost(G);
		else if(flag=='0')break;
		else
		{
			printf("您输入的信息错误，请重新输入");
			scanf("%d,&flag");
		}
	}
	system("cls");
}

void onetoanother(struct matrix *G)	//主函数中的一个分函数，显示一城市到其他城市的信息
{
	system("cls");
	char flag;
	while(flag!='0')
	{
		printf("可输入以下各城市序号或城市名:\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s",cityinfo[i].number,cityinfo[i].name);
		}
		   printf("\n\n");
    printf("\n");
	printf("\t　     ╭─────────────────────╮\n");
    printf("\t       ｜   对一城市到其他城市的相关信息进行处理   ｜\n");   
    printf("\t　     ｜─────────────────────｜\n");   
    printf("\t       ｜       1、城市到其他城市的最短路径        ｜\n");
    printf("\t　     ｜─────────────────────｜\n");
    printf("\t       ｜       2、城市到其他城市的最小时间        ｜\n");
    printf("\t　     ｜─────────────────────｜\n");
	printf("\t       ｜       3、城市到其他城市的最小费用        ｜\n");
	printf("\t　     ｜─────────────────────｜\n");
    printf("\t       ｜       0、返回上一个子菜单                ｜\n");
    printf("\t       ╰─────────────────────╯\n");
    printf("请输入数字(1,2,3,0):");
	scanf("%c",&flag);
	if(flag=='1')	otaminpath(G);
	else if(flag=='2')otamintime(G);
	else if(flag=='3') otamincost(G);
	else if(flag=='0')  break;
	else
	{
		printf("你输入错误!请重新输入:");
	    scanf(" %c",&flag);
	}	 
	}
	system("cls");
}

int main()
{
	struct matrix *G;
	FILE *fp;
	system("title   全国交通咨询系统");	//程序的标题
	if((fp=fopen("F:\\交通数据.txt","r"))==NULL)
	{
		printf("未检测到文件，请按y继续！");
			while(getchar()!='y'||((fp=fopen("F:\\交通数据.txt","r"))==NULL))
			printf("请将网络图矩阵存放到'F:\\交通数据.txt',按y继续\n"); 
	}

	create (G);	//创建图
	char flag;
	while(1)
	{
		printf("可输入以下各城市序号或城市名:\n");
		int i;
		for(i=0;i<6;i++)
		{
			printf("%d %s\t",cityinfo[i].number,cityinfo[i].name);
		}
			printf("\n\n\n");
		 	printf("    \t☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆\n");   
	        printf("    \t☆                                                          ☆\n");   
	        printf("    \t☆              1.咨询一个城市到其他城市的信息              ☆\n");   
	        printf("    \t☆              2.咨询两个城市之间的信息                    ☆\n");   
	        printf("    \t☆              0.退出系统                                  ☆\n");   
			printf("    \t☆                                                          ☆\n"); 
		    printf("    \t☆                                                          ☆\n");
			printf("    \t☆              此系统可提供旅游的计划安排                  ☆\n");
	        printf("    \t☆                                                          ☆\n");   
	        printf("    \t☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆\n");  
			printf("请输入数字1,2,0");
			scanf("%c",&flag);
			if(flag=='1')  onetoanother(G);
	        else if(flag=='2')  onetoone(G);
			else  if(flag=='0')  break;
	    	else 
			{
				printf("你的输入不正确!请重新输入:");
	            scanf(" %c",&flag);
			}
	}
}
