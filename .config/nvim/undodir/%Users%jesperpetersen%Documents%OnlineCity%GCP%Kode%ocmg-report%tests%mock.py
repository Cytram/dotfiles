Vim�UnDo� g|�A� �����?rߚd��w�I�}��  �           M                       ^�    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             ^�     �   �   �  �                  '{prometheus}?'5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^�     �   �   �  �      $            promteheus + urlencode({5�_�                    �   M    ����                                                                                                                                                                                                                                                                                                                                                             ^�/     �   �   �  �      P            'smses_status_total{status!="ENROUTE",status!="ACCEPTED"}[24h]))'}),5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^�:     �   �   �  �      %            prometeheus + urlencode({5�_�                   �       ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�     �   �   �  �      $            prometheus + urlencode({5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�     �   �   �  �      prometheus + urlencode({�   �   �  �      %        Mock(prometheus + urlencode({5�_�                     �   M    ����                                                                                                                                                                                                                                                                                                                                                             ^��    �   �   �  �      M            'smses_status_total{status!="ENROUTE",status!="ACCEPTED"}[24h]))'               }),5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             ^�B     �   �   �  �      $            prometheus + urlencode({5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�K     �   �   �  �      S                'query=(sum(increase(smses_status_total{status="DELIVERED"}[24h]))'�   �   �  �      O                '-sum(increase(smses_status_total{status!="DELIVERED",status!='   E                '"ENROUTE",status!="ACCEPTED"}[24h])))/sum(increase('   T                'smses_status_total{status!="ENROUTE",status!="ACCEPTED"}[24h]))'}),5�_�                    �   K    ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�V     �   �   �  �      L                'query=(sum(increase(smses_status_total{status="DELIVERED"}'                   [24h]))'5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�Y     �   �   �  �                      [24h]))�   �   �  �      U                [24h]))-sum(increase(smses_status_total{status!="DELIVERED",status!='5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�^     �   �   �  �      V                '[24h]))-sum(increase(smses_status_total{status!="DELIVERED",status!='5�_�   	              
   �   L    ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�d     �   �   �  �      M                '[24h]))-sum(increase(smses_status_total{status!="DELIVERED"'                   ',status!='5�_�   
                 �       ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�f     �   �   �  �                      ',status!=�   �   �  �      N                ',status!="ENROUTE",status!="ACCEPTED"}[24h])))/sum(increase('5�_�                    �   I    ����                                                                                                                                                                                                                                                                                                                            �           �                   ^�     �   �   �  �      I                'smses_status_total{status!="ENROUTE",status!="ACCEPTED"}                   '[24h]))'}),5�_�                    �   I    ����                                                                                                                                                                                                                                                                                                                                                             ^�    �   �   �  �      J                'smses_status_total{status!="ENROUTE",status!="ACCEPTED"}'5�_�                     �       ����                                                                                                                                                                                                                                                                                                                                                             ^�     �   �   �  �      prometheus + urlencode({�   �   �  �      %        Mock(prometheus + urlencode({5��