PGDMP     "                    {            library_dev_db "   12.17 (Ubuntu 12.17-1.pgdg20.04+1) "   14.10 (Ubuntu 14.10-1.pgdg20.04+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    65831    library_dev_db    DATABASE     c   CREATE DATABASE library_dev_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE library_dev_db;
                postgres    false                        2615    2200 
   library_db    SCHEMA        CREATE SCHEMA library_db;
    DROP SCHEMA library_db;
                postgres    false            �           0    0    SCHEMA library_db    COMMENT     :   COMMENT ON SCHEMA library_db IS 'standard public schema';
                   postgres    false    3            �            1259    65838    books    TABLE     �   CREATE TABLE library_db.books (
    book_uuid character varying NOT NULL,
    title character varying NOT NULL,
    author character varying NOT NULL,
    genre character varying NOT NULL,
    publisher character varying NOT NULL
);
    DROP TABLE library_db.books;
    
   library_db         heap    postgres    false    3            �            1259    65846    borrowed    TABLE     �   CREATE TABLE library_db.borrowed (
    borrower character varying NOT NULL,
    book character varying NOT NULL,
    borrowed_from date,
    borrowed_to date,
    borrower_id character varying NOT NULL,
    book_id character varying NOT NULL
);
     DROP TABLE library_db.borrowed;
    
   library_db         heap    postgres    false    3            �            1259    65832    users    TABLE       CREATE TABLE library_db.users (
    user_uuid character varying NOT NULL,
    last_name character varying NOT NULL,
    first_name character varying NOT NULL,
    member_since date NOT NULL,
    member_till date,
    gender character varying(1) NOT NULL
);
    DROP TABLE library_db.users;
    
   library_db         heap    postgres    false    3            �          0    65838    books 
   TABLE DATA           O   COPY library_db.books (book_uuid, title, author, genre, publisher) FROM stdin;
 
   library_db          postgres    false    203   �       �          0    65846    borrowed 
   TABLE DATA           h   COPY library_db.borrowed (borrower, book, borrowed_from, borrowed_to, borrower_id, book_id) FROM stdin;
 
   library_db          postgres    false    204   Z'       �          0    65832    users 
   TABLE DATA           h   COPY library_db.users (user_uuid, last_name, first_name, member_since, member_till, gender) FROM stdin;
 
   library_db          postgres    false    202   �9                  2606    65855    books books_pk 
   CONSTRAINT     W   ALTER TABLE ONLY library_db.books
    ADD CONSTRAINT books_pk PRIMARY KEY (book_uuid);
 <   ALTER TABLE ONLY library_db.books DROP CONSTRAINT books_pk;
    
   library_db            postgres    false    203                       2606    65853    users users_pk 
   CONSTRAINT     W   ALTER TABLE ONLY library_db.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_uuid);
 <   ALTER TABLE ONLY library_db.users DROP CONSTRAINT users_pk;
    
   library_db            postgres    false    202                       2606    65856    borrowed borrowed_fk    FK CONSTRAINT     �   ALTER TABLE ONLY library_db.borrowed
    ADD CONSTRAINT borrowed_fk FOREIGN KEY (book_id) REFERENCES library_db.books(book_uuid);
 B   ALTER TABLE ONLY library_db.borrowed DROP CONSTRAINT borrowed_fk;
    
   library_db          postgres    false    2844    204    203                       2606    65861    borrowed borrowed_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY library_db.borrowed
    ADD CONSTRAINT borrowed_fk_1 FOREIGN KEY (borrower_id) REFERENCES library_db.users(user_uuid);
 D   ALTER TABLE ONLY library_db.borrowed DROP CONSTRAINT borrowed_fk_1;
    
   library_db          postgres    false    2842    202    204            �      x��Z[s�H�~V�
�K��"B�[f>���b fc#&Nf�ti\%y$ޚ_��Q��6�n�l��r.��d�*��l�Eg��r&d.�uʼ�UEU�Mrr�i��v�}7mۮ�v/��+N·����Ez�	���M���u�ߤ�v�E�"���R��g6��D5)�p���M�4����h�}N�@+�$�v��a�\qw�3,t�U��*SE]g�"#n|VU(�ުPb���+���sW�8����������䒶�Z�Xټ"�r���1s����<s��Ɋ�K���g�ǋ.��=[׺"��Y��YEeu�j��klU���鄵�������^r�|��pGCx�����'��h��Ef�ʳ��*�NUt��:�Mr�ٮy�/iC��Gy9�_��;D�����OSH��T�F
�����d�r�����yr�!ac;�H����m�z��w��Vg�!�qqz��.L0&�hpV.3K�����ɫ�+^�zLK�y�wcr:�w݋����U�
���Y�*37NY�ATH%'��v��,�8}ۅ��C,_� <��I�ZO�ƫ��oB��$�.S̮
�:Z,?!K)�5'��x��6'�?����!};�碽^-'��qQ��6��LY��u=��R���HNFڴ����u�����Q�.B�v�2W�9j�U��hɢK���;)0=Z�a��'�I�A�l^�_����M�<n�E�y�(��P�7J��>s�B�0��O,�S�������s�t|��sv�6t��I���)��eEѠ���e3���HM^(�]v�a�ϫ�9]2��9����v��[���LE���&+<J����̌)b���ҹ��	%V$'�� �5u�����'�~ڇ5����p��eY c�JyȌ�@F��%���߬yӶKO]�B�a�{ �rE��Qx��VG�W�#	
g�0�6�؇���'��P�o�YR��_�����P�Rj5_4
0[��X�u@Br�����¹^M�n;��滅�'��j�=uc�h�H�GU��ʈH�h�(�^��c��#߮~|�h
��pY�E�h��,���6NH�'g�-Iۻ�@_���a@Q������[>.����q��tegu]����cUe:4��.�48�l����g��v���d�q��O(���WJ�k?�C�q`ˋm7ῦ� (oy}��e��m�W���(�B��L
���B�K+0��P�J����$�#���:����q��ۅ/�X�'V�$֜Q�UUm�M��Â���� ����iv ��~']�[m��,�Br@�ڔE�� $�Ec���!W&��կ�����ˮ�D�z��÷`zmq��H�a�-B�~i�V�q�^��P����=�U�Ɲ�s�ֆ$�D����+�a컅���2��7(��"��)fy�����`��lh7<���¸"�u�v�6ޠ._�zPͳ�	������ܦ�{�}\�Էu(7Qz�έx�=�$�Ў�����0==��-�Ƹ��3�Aj��pr�>�C�m���!a��/���PޓT�Hӡ�@n�����~�	��k�t!N�A*�����ȋ�6���y��<YλE��M�g���
�dei3�B���R����S�-���}���AR���A�t�9�O�0�]����A.�]�Mh�\�PEAe8�J���6Ax �],�--�a ����>�@��WE�m_r�Cl�9@2EZ�ֽ������d�+�OG�AxX��p�|��%]���}����@ȡ��T���m
cM�����_i}�ǐ�uڮ�{��gtn�P���)�@��^0JE`���r[��F���|�L�.����W��N���u�Q��(�Šjj�3U��m�W���	̛ދPps'|�2�x�Țܷk�6�cf}�����8j�y=|�(y�f?/��bqY�D?�#��a��F5�^�qޢ�����p%7��kZ�P���1�+ �j�8��A ��Q���T	�e[5Tg6/b�k�<�9h�$���D���w�	\�P����8=`�����y���L��wP=��:X]���R����>t�[��)��P�O�z�c�_dB��&��!m.��! �&�2,��a�X����U����v���j��&����f�/�k]��|�q� �e�Y������uO�%\�ը�����~�BG�(V5�z���l��S���'TW?�A{#c������F��|�%�����H�g����
����v�絎um"V�"=�^���&�F�!@w"B�XX��8(-��t�aK�2�6Q���D_J; >{��~迉���^X>�PNDUȊZ<�weF��`�]	ȍ���Wx��{,����nǛ#ݧɿ�ᬇ��A7µ�@7H�D"�@O疔��g������3���F�C��\Xή����y[ D/����
b} ":�w/6�?o����F�ɩ�� ݡ;)�_� oP�,��/l�������a�f��b����O��y�	����� �%��[f c'p��Ԡ<5Lx�s�)��� >���&}��<�Q��f{���.A�܎;������dz�����٤ PV���K�\G#�կae\�C?���}�.�װ�_Z���v_!u#��.I28i4���U���4v�`P�_����w�T8}	�K�̲#]�r@vꭌX���S��9�O~����]͍�L�
��H0T�w�Ax�4�M�n��ӫ#
`��	 �!,��C���v%�E������٬6�v�F�*��c�
4R�mmD��	�R� $�@�-mQO_^�˗O!�WA�C\ ���Ψ���(U.��������S)�K�jg�y�O�*�r�̘e2�c,��.4�D�B��7�qo��4_cL.����^7�8��LO�(;�o��`�P>�9QA"�>:�Ba|Q���d���93=��{4�j3B����74>�o?�{"�*X
��S2��@����<�E~�&y��#��h`�ؿ����pP��Ī���� ��j�HA�w��*�(��~5��KQ�����ɛX#�\/�A��16r9� P�'H�Y��늶�G]�Z���u��ዅ)-y�f�\�$��!*�5
1������сg�ds�N���^*2�U��!kܚ�l��0��lp>�rw�%9(���a�'6���[���K ��B\<8LF;IK��b��w��%�LP�/���Qf�_��j�bA�D`V70�9�3>#y�2��U^��ϥ�Y�����%q����G�ˈCp�K�Sak4�56���>NwP���{���;W�	�?�g���Je&�d8�Ws�p��;	��JS~O��hix�D?��C�ƈc-+g~��e��A]�.A�D�P�/�=�[�rj��[�a�3BG� ��IU��I8�cT1��r�0-·It�K#L�5�P�"Q��6)ӱ42�r���e��:���������e��6�}-�
�X����A*;� ���p^���*��2#�/t�ƽ��?2@~R,�����$`���%�`\�$fM@���PQ7��K�Q�n�|ŗ�������g�)<�HQ"+�����h$]it+A�tXv��L�}��q�������2�py�D����Ei�4�U��#lҰQ�����Ї�F����0#��j/�� #,�إ��t��_�d���@�e%�DݭA0�0��L�.C^$���W�P�Ϫ�2b*]XxiJ�k�7��xUs��aHi���`��J����kc%�2��a�6�i���pD=�:�*:r�$K������B;6��XHF�� �[�
�UA�j�����I���{�ي]���YA��s%S�.��d���5	��*�Z��{)�G���ۑC����<<��W�xPz�Z�	��G��E�'W2��{�J^�E0e�^��O��M��� � 1X��p��@��C �T�v���{���Ͷk���.w��!�i+�hE��ϱ����"X�� ��
`�` d  ����>�
ԗFv{C���)d�g��;X�H��U�0�|c!��"��M+Wk��,����i'9B\��.C�ź/O[B@�C49!���Qs�:=U	F���a;�����!�Qk �+dL�|����Η�htl�BYߏ��n��P7��^���@`�gEZ6�xjpa<��Jޜ�#��(>�Eͦ�0�x�)���eh4�P��CF��4 6c�E�&+�|b��Q%#ÛV�.�Z���Gn��Wdy��N�J,# @1�`��y<6u �H�p���4آn�<�����ꍼ�\%K�����DI��]���'֟*���e�b�z86� %\C�A"����o��c�fՏ��u�o�2��7���s�3���2�}�(��֗��:>F~�(Ro�ߤ_>���n��)��W��'f���Y�B�wk��Zd�x%h����}�1��VPe��>�A1��6]S�d�ʣv%�/c*,{���g�^d�o�u$��Y�X\�e�  ٷ�J��\�R����i�A��uL"B2ݿ��ͬ�6dM����f{;��@��_�G���fy�>,���T�`g�q�ڐ�F�ԃ�9g??���� 6,~�����zyV��:�Q36�@6tYKX�y���<p����du�^">i��eZ�e̽nLffE��C�ʛe�W��:9>4"5�<=���j�a}�%�o~�x��ßP��(�ԍHB�� �1��r�<�Xmmd�����x�ap�2# �Bo)c���@O�f�]��~�;������吾�]�k$�����5��w(���?�����!�� p@kC��;�g:�2&m*Õ��k���E�\� m�~��O�0���_��!�J�::���A�}E�:�O��'��_E��5[��sf�
4��
���M>��N�'��:�P�R�]+�9Y#a�����{�J�J�F>���wS�@��j��,��<-�gpߏ����Z�/�	<��#��QJ���BY�fGP\��>]�ZbZ�_p���<�I��Wz�-����9�b��U����D��7t? �!# E��	e� �����]�A�}mG������^��-���Ghi�w���Y�Y�W��u�E��'v�Ͽ�u(��?�3~h��g�\ �ʡEK��,z((#�xS�V`�J�_�l��&B��z�u��j��r��4u�U��b���=]/��B��6?�L^ ��j$K���l������k+&�����c�_���Q� V����%����B���2���X)��'���� �w~-d��;��������������\,� ��      �      x��[ْ7�}f}����+;�$�G�,��qI
�lEL��b�H�&IZ���9@&��"	ꘉP�(�E �r�9�"��fq�j���]�~�[;X�a;c�膈���%33f��Q�&� ��iָX#�5A$G�f3��Q�F��6mТq!��Z��DX�^���b�~�l׏�/����ݰ]��4�����q�]m�l����>s��o�T�i}2�M,5���R�=�v�[+��]�u�
�p ��Y�T�ȝ��y�ڭV�����v7���m|���� �E��^�ή�[��`���%���4���ek"i"Ӵ����|l)�Lymݬ2��i�0[���^50T��Ӥ\�yv�۷��8�~ڭ��Y�1�M�����6[�S���ɴę��F�|��ў� �������d�3O�L���'	��V7ֶ�.��J��k���wC���q�G)~����.!x���;�ab�s���Ĥ�3�F��5&0Ü�j5&��z��Z��G�66���9N㹾yi�!n���֏�e|�}W��_t�8�%�a���~��+�!���-����f���C��P����#xj11�| ��$4�0N$q6-�j�������~���?ۡ[�_.�faq����n�}�9Nx�T9S^��3E|^���$Z$ҫ�)��kER�2bo^�?��_:�����O˸��;���S�DX���7�������l�S��Ò��Gd-�a<���D+u�J;)� 3�q4͑�&��%8�֎4��oR�1���~�g��>�����h�d���7�UqR����i)�b%s]iX�jK�a<dk��~&��pJ 
XD0@��QX,�(m��7�����v�Ef�W��}*9�2�P1-2��A�'��t���4FiT�e�����n��%�a�wO��%�m��k�|�t�C�}J㏘j	O�dtK�/�A$/�
¢�3)�a<�F�Ѷ�d�`�^��2^��72	��&�%�Di�Ue�1j_���v�'����_Ƶ�#�����R���	Q+Iܵ0�KG�r	�-�lc6��=/x{܎	���K|�i��uU���+n��8��V#���Rx���������
������S���~ݯ:�9T_�qe���yj[��h��)�x!8*�E?ۿ���l�W��!���X\���,�b�9��E$����4 �@8;�E��Jo���6�ۻ�jn��!�zr@Ͷ�Ę���P�H46N�7$��Ym]H������ᒎ����U!DU�=u���n@j���M�G\=A� �a(�60@e�2���B9�`f)����y��=���:"���6G򳏂�2��&C�e�&�cD��!�׺\�|�-�1��H9Rb��ؠ����C?|���"/Y��*��i#QI=En����J�]2�8vj�w�����ݢ[��קö�NK^�z�%��AQA=��V� 	Bٜ/�}�����G���%xzHW��YF|�%~���I������ଲXBD�:l�a�i�@�b�!Ъ��_���r�YQVx;,���=��s�`��@n��|b�W�h�S��k��C����]�d9)Eu��� 	�����K��~ŵ�&���� ��]�^G�u��Y�*�8���0�̑M�>�@���0�N祸L��oAW�����8PG��?�.�=�0Hӌ��
0�M@�`%�n~�O��n����b�,;���r���f~�G!Ď�JμlA�oX(e8�z�|
L���#��1pX��`Nj��6�=�LtҴ������v~�{\��E�jlZ/T����>rߐ �!��L+,�)��f&8����"�s$�:du�� 6.�/a�	��t�%�Jh@Q��`Ԋ���Q"�7t��%�=��KV����GԮh��
8(�hH�T9�S˿Z"����[g�)��eO9-Y��*Ӈd��I�0Θ���J`6����g���~�p�Ч-��3�$��0#΀�4�� ��2;��@ނ����g��ܤtF�(�޺JT�M�.o���T�S�vdFy)r9�r>BP �i��,�#s8�g8�m ������O�����q�{M��P���2ॣ���.�(r5 ��\xO9ǟh�j�OJ��Y!)Y�U��*��!���<��8B���"���x�c��<��9�j!08��7�E.g�IP���x��({b������?�j��{�g�:sHkD$"*���3�T��\����������C(�}�L����	'BR{� 	�f��\B�殦�n��{~�O�i^�l����zes9�}�� ��:��Ȓ��v4��>-�e��4u�کKWP�*����ȣ���࡯VKb��.(Ө���*[�.Mk(Ӆ���v���La�[1��s�����"����Z�)�`*JF��4&q�(
���B��NܗU��t��9O*�q5*��W+gi���K���j���y�o��O]�q����LM�p��}Z�Tg���lؔ����h����A%������#`�R� U�Qu�S�<��C��-������L�cW��������ve�Ġ�`���@Z>����>�^5���@G��n!\��(KZi��f���C%�DR#��`��B.2`~v���B�l�=G��I�m���Y�hicT�Q9��`!,Ѥ�����x�����|j�L�K�I��%���1O���rNG�(�,:83"�%���CtLs��:�A�#���G��_
g�*���)Xр�7J菤t��I�U)%��A�27N뀽CNR���A=���`%��;���־_�P�?t�Я��=X6@]?$���`���� ~-�2���4��?���K����A���i�=7�a	P�	z�bÆT�V m��hTl�B����݉��`���V�F��@�l���denM���G�̃rs�??����/��f�D2N�� �;�e���g��!�j^8
̤AiwN��k�I�C5g�ԺJ�^������ Ka`up��U���m�F׏FUU���qw��#���Xaf�2�Ԣ���1�gV�Z
Ha�Ĩ0Zi��Rp�%x��Fv��$%/k��U�6���n�V�
�����j�A��	$s�qI�ݑ*D��"oP��L�=��`65$�v�p�t
DK�C(�a��6q�#4��Vt�W�iD��
z7
 R�+~�\��2��rc�.ǒ�a�X�<,kb(Q�;�?JG:�!rw�%�(P���$�m���n�̊����i�V*�p�B��ܽ�Њ��Z��b��ܱ��<;��-V5�=��˽��Li=�}:TǪST��/���";b��/�������,Fp���U�zh- �Ze�J�L���
<p��pQ߮��X��GFJ�*o(�Hp�GU�> #A�j���(�Sd@MK�L\|\���?l�]Q*6����!�.�v�X��=�Ҡ��Z�,a�%�o�Y��/�����]zF�����p4E�:,y��
�N������pa�qV
U�	kf�m������z���T��^�Ę;"��X�4�o�)�N�Ќ�g8��F�7>�!kyaU���_��ow�<{ �S�_�#�� cYW��H��D�Y-�Yt w"!#�
ɝT��M�ɸ5����,TM�O��k�}�
��m��*�~FT�u����r�����\�� �냔ir'�;�
��)���Ks�q^��e��TEF���#W���G	7����Kx5����v�sv�����5�|bo����
i$j50BB;z�t�Gf�&]�76��l��U��c�zv�8����GW56L��L@J�E��-�^�<��*۳T���M}����ro��2R���z>��5O*ʾ�d��-�z��VW��l ��Д��e���E��U�Y�)��-��h�;D��W ������8���C?,Q���/��1��e�\�$��2H|!x�d��P���J9�*qv;�.�XP{����	U��x]��mcF}��4�iXGk�����I7�q$���BgU��4��y�U�Y=/n�^����m�*_Ƞ�ml x  �8yLNO�a7v��19ވ�n՝@��t y;��"�s%��ʵ͊-�{LQS� �%�)z�o��e�|鎰"�jo�T��=g���8=����D�K,5����է����"�P���}ȓ��>=�E<�X�/i� ��
^:�a��S���Y�1������X�Gp �����o�+��4Rrvl,׾kT5���>�X�`QK���HJ�)e���9Et4 ���F�Q��g -��D��2������b��n}q���B˴�T�g�äT�Pk��Q@ZE�U%dI+��p~SAMM%:�ަR��:����
����^vχ��H~򲼥W�� \܀��YRfh��Cq�H�ϯ[}�^~��Q�:
U8Vu/���!>�a?����_k��6�-�l	5
�q	�QE���":=ȿ���9��Y^.���Q��N��㨜�d\��
*S�b�I�q�vU�P�|��7(1�_�.����e�3CD��F�|�!9Q(��7�NL�b�������x,_���Ņ�ć���*"p�ˋ�R�I�Vc�����x�f,���W'I�uNv(�JU��Iҕf�7-Cˍ��Nq�,G�k,s����\�H��AŲ�T������������      �   �  x�]��n1E��)d�˯e�"���$�M�]�i4��y���q�D!yѽ��{ˇV�4�J��Ku�Ķ�%����l�̼�΂u㘧�L-�D�
�S�.��JÂ"-qN�����������`�� ��`�T5:��H��T!rlhc���<��bw��+��`��r�>˄<�hr�r�C&#HoQ����֌��v>n��n�qQ�lZI�����er�G��!YW�������l�ͻ��@�0����*@3�G�y�T3��?/�ea�5X�W�����f��2���2[`$F*�z!��q��γ������z7�>}r1�<����NA2��Z��ૐ��en<���n:�����4��S[�p��raWs�������k�O����*�"0�YH��N���=���ys�雹)�u���{�}*��𤋮��ueƖY��u���lnΛ��ė����/E�+���4M \�Ǆ     