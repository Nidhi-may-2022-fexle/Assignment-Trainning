public with sharing class PatternGenerator {
    //Left Triangle Pattern
        public static void createLeftTrianglePattern(){
            integer k=6;
            for(integer i=1;i<=9;i++){
                if(i<=5){
                    k--;
                }
                else{k++;}
                string s='  ';
                for(integer j=1;j<=5;j++){
                    if(j>=k){
                        s = s + '*';
                    }
                    else{
                        s = s + '_';
                    }
                }
                system.debug(s);
            }

        }
//Down Triangle Pattern
        public static void CreateDownTrianglePattern(){
            boolean b=true;
            for(integer i=1;i<=5;i++){
                string s='  ';
                for(integer j=1;j<=9;j++){
                    if(i>=2 && i<=4){
                        if(j>=1+i && j<=9-i){
                            b=false;
                        }
                        else{
                            b=true;
                        }
                        }
                        else{
                            b=true;
                        }
                     if(j>=i && j<=10-i && b){
                        s = s + '*';
                     }
                     else{
                        s = s + '_';
                     }
                }
                system.debug(s);
            }
        }
            

        //Left Pascal Traiangle Pattern
        public static void LeftTrianglePattern(){
            for (Integer i=1; i <=5; i++){
                String s = ' ';
                for (Integer  j =i; j<=5; j++){
                    s = s+'_';

                }
                for (Integer k=1; k <= i; k++){
                    s = s + '* ';
                }
                System.debug(s);
            }

            for(Integer i = 5; i >= 1; i--){
                String s = '_';
                for (Integer j = i; j<=5; j++){
                    s = s + '_';
                    
            }
            for (Integer k = 1; k<i; k++){
                s = s + '* ';
            }
            
            System.debug(s);
        }
    }

    //Square Pattern printing
    public static void SquarePattern() {
        for(Integer i =0;i<=5;i++){
            string s = ' ';
            for(Integer j=1;j<=5;j++){
                s = s + '*';
            }
            System.debug(s);
        }


    }

    //IncreasingTrainglePattern
    public static void IncreasingTrainglePattern(){
        for (Integer i=0; i<= 5; i++){
        string s = ' ';
        for(Integer j=0;j<=i;j++){
            s = s + '*';
            }
            System.debug(s);

        }
    }

    //Reversed Pyramid Star Pattern 1
    public static void ReversedPyramidPrinting(){
        for(integer i=5; i>=0; --i){
            String s = ' ';
            for (Integer space = 1; space <= 5 -i; ++space){
                
                for (Integer j =i; j <= 2 * i-1; ++j){
                    s = s + '* ';
                }
                for(Integer j = 0; j < i - 1; ++j){
                    s = s + ' _';
                }
                
            }
            System.debug(s);
            
        }
    }

    //Reversed Pyramid Star Pattern 2
    public static void ReversedPyramid(){
        for(integer i=1;i<=5;i++){
            String s = ' ';
            Boolean k = true;

            for(integer j=1;j<=9;j++){
                if(j>=i && j<=10-i && k){
                    s = s + '*';
                    k = false;
                }
                else{
                    s = s + '_';
                    k=true;
                }
            }
            system.debug(s);
        }
    }

    //Pyramid Patterns Program
    public static void PyramidPatterns(){
        for (Integer i = 0; i<=6; i++){
            String s = ' ';
            for (Integer j=i-1; j>=1; j--){
                s = s + '* ';
            }
            for (Integer j=0; j<=i; j++){
                s = s + ' ';
            }
            System.debug(s);

        }
    }


    //Number Pattern Program
    public static void NumberPattern(){
        integer k=1;
        for(integer i=1;i<=5;i++){
            string s = '';
            for(integer j=1;j<=i;j++){
                if(j<=i){
                    s = s + k;
                    k++;
                }
            }
            System.debug(s);
        }

    }


}