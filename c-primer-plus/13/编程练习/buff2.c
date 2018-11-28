          
		          

				  #include <stdio.h>
				  #include <stdlib.h>
				  int main(int argc,char *argv[]){
				      
					      const size_t bufsize = 1024;    
						      FILE *f1;
							      char buf[bufsize];
								      
									      int readbytes = 1;
										  	//testfile content
												/*
													1. one
														2. two
															3. three
																*/
																    f1 = fopen("testfile", "r");
																	    if(f1 == NULL){
																		        fprintf(stderr, "Can't open %s\n",argv[1]);
																				        exit(EXIT_FAILURE);
																						    }   

																							    
																								    if(setvbuf(f1, buf, _IOLBF, bufsize) != 0){ 
																									        puts("set _IOLBF fail");
																											        exit(EXIT_FAILURE);
																													    }   
																														    
																															    while(readbytes){
																																        while(0 < (readbytes = fread(buf, 1, bufsize, f1))){
																																							  fputs("line ", stdout);
																																							              fwrite(buf, 1, readbytes, stdout);
																																										          }   

																																												      }   

																																													      fclose(f1);
																																														      
																																															      return 0;
																																																  }



