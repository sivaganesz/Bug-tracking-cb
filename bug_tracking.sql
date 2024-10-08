PGDMP      )                |            bug_tracking    16.3    16.3 9    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17174    bug_tracking    DATABASE        CREATE DATABASE bug_tracking WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE bug_tracking;
                postgres    false            �            1259    17175    bug    TABLE     �  CREATE TABLE public.bug (
    bug_id integer NOT NULL,
    bug_name text,
    request_id integer,
    customer_id integer,
    tester_id integer,
    summary text,
    feature_workflow text,
    severity character varying,
    steps_to_reproduce text,
    status character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    bug_tester_comment text,
    bug_customer_comment text
);
    DROP TABLE public.bug;
       public         heap    postgres    false            �            1259    17181    bug_bug_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bug_bug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.bug_bug_id_seq;
       public          postgres    false    215            �           0    0    bug_bug_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.bug_bug_id_seq OWNED BY public.bug.bug_id;
          public          postgres    false    216            �            1259    17182    bug_history    TABLE     �   CREATE TABLE public.bug_history (
    bug_id integer,
    bug_name text,
    request_id integer,
    customer_id integer,
    tester_id integer,
    summary text,
    status text,
    completed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.bug_history;
       public         heap    postgres    false            �            1259    17188    customer    TABLE     �   CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name text NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    17193    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    218            �           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    219            �            1259    17194    projectmanager    TABLE     �   CREATE TABLE public.projectmanager (
    manager_id integer NOT NULL,
    manager_name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
 "   DROP TABLE public.projectmanager;
       public         heap    postgres    false            �            1259    17199    projectmanager_manager_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projectmanager_manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.projectmanager_manager_id_seq;
       public          postgres    false    220            �           0    0    projectmanager_manager_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.projectmanager_manager_id_seq OWNED BY public.projectmanager.manager_id;
          public          postgres    false    221            �            1259    17200    request_acceptance    TABLE     s   CREATE TABLE public.request_acceptance (
    request_id integer,
    customer_id integer,
    tester_id integer
);
 &   DROP TABLE public.request_acceptance;
       public         heap    postgres    false            �            1259    17203    tester    TABLE     �   CREATE TABLE public.tester (
    tester_id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.tester;
       public         heap    postgres    false            �            1259    17208    tester_tester_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tester_tester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tester_tester_id_seq;
       public          postgres    false    223            �           0    0    tester_tester_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tester_tester_id_seq OWNED BY public.tester.tester_id;
          public          postgres    false    224            �            1259    17209    testing_request_history    TABLE     �   CREATE TABLE public.testing_request_history (
    request_id integer,
    request_name text,
    tester_id integer,
    customer_id integer,
    status text
);
 +   DROP TABLE public.testing_request_history;
       public         heap    postgres    false            �            1259    17214    testingrequest    TABLE     #  CREATE TABLE public.testingrequest (
    request_id integer NOT NULL,
    customer_id integer,
    web_application_url character varying NOT NULL,
    status character varying NOT NULL,
    request_name text,
    email text,
    password text,
    accepted boolean,
    block_reason text
);
 "   DROP TABLE public.testingrequest;
       public         heap    postgres    false            �            1259    17219    testingrequest_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.testingrequest_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.testingrequest_request_id_seq;
       public          postgres    false    226                        0    0    testingrequest_request_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.testingrequest_request_id_seq OWNED BY public.testingrequest.request_id;
          public          postgres    false    227            :           2604    17220 
   bug bug_id    DEFAULT     h   ALTER TABLE ONLY public.bug ALTER COLUMN bug_id SET DEFAULT nextval('public.bug_bug_id_seq'::regclass);
 9   ALTER TABLE public.bug ALTER COLUMN bug_id DROP DEFAULT;
       public          postgres    false    216    215            =           2604    17221    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    219    218            >           2604    17222    projectmanager manager_id    DEFAULT     �   ALTER TABLE ONLY public.projectmanager ALTER COLUMN manager_id SET DEFAULT nextval('public.projectmanager_manager_id_seq'::regclass);
 H   ALTER TABLE public.projectmanager ALTER COLUMN manager_id DROP DEFAULT;
       public          postgres    false    221    220            ?           2604    17223    tester tester_id    DEFAULT     t   ALTER TABLE ONLY public.tester ALTER COLUMN tester_id SET DEFAULT nextval('public.tester_tester_id_seq'::regclass);
 ?   ALTER TABLE public.tester ALTER COLUMN tester_id DROP DEFAULT;
       public          postgres    false    224    223            @           2604    17224    testingrequest request_id    DEFAULT     �   ALTER TABLE ONLY public.testingrequest ALTER COLUMN request_id SET DEFAULT nextval('public.testingrequest_request_id_seq'::regclass);
 H   ALTER TABLE public.testingrequest ALTER COLUMN request_id DROP DEFAULT;
       public          postgres    false    227    226            �          0    17175    bug 
   TABLE DATA           �   COPY public.bug (bug_id, bug_name, request_id, customer_id, tester_id, summary, feature_workflow, severity, steps_to_reproduce, status, created_at, bug_tester_comment, bug_customer_comment) FROM stdin;
    public          postgres    false    215   �G       �          0    17182    bug_history 
   TABLE DATA           z   COPY public.bug_history (bug_id, bug_name, request_id, customer_id, tester_id, summary, status, completed_at) FROM stdin;
    public          postgres    false    217   �G       �          0    17188    customer 
   TABLE DATA           O   COPY public.customer (customer_id, customer_name, email, password) FROM stdin;
    public          postgres    false    218   �G       �          0    17194    projectmanager 
   TABLE DATA           S   COPY public.projectmanager (manager_id, manager_name, email, password) FROM stdin;
    public          postgres    false    220   zH       �          0    17200    request_acceptance 
   TABLE DATA           P   COPY public.request_acceptance (request_id, customer_id, tester_id) FROM stdin;
    public          postgres    false    222   �H       �          0    17203    tester 
   TABLE DATA           B   COPY public.tester (tester_id, name, email, password) FROM stdin;
    public          postgres    false    223   I       �          0    17209    testing_request_history 
   TABLE DATA           k   COPY public.testing_request_history (request_id, request_name, tester_id, customer_id, status) FROM stdin;
    public          postgres    false    225   �I       �          0    17214    testingrequest 
   TABLE DATA           �   COPY public.testingrequest (request_id, customer_id, web_application_url, status, request_name, email, password, accepted, block_reason) FROM stdin;
    public          postgres    false    226   �I                  0    0    bug_bug_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.bug_bug_id_seq', 1, false);
          public          postgres    false    216                       0    0    customer_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);
          public          postgres    false    219                       0    0    projectmanager_manager_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.projectmanager_manager_id_seq', 1, true);
          public          postgres    false    221                       0    0    tester_tester_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tester_tester_id_seq', 4, true);
          public          postgres    false    224                       0    0    testingrequest_request_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.testingrequest_request_id_seq', 7, true);
          public          postgres    false    227            B           2606    17226    bug bug_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_pkey PRIMARY KEY (bug_id);
 6   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_pkey;
       public            postgres    false    215            D           2606    17228    customer customer_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_email_key;
       public            postgres    false    218            F           2606    17230    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    218            H           2606    17232 '   projectmanager projectmanager_email_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.projectmanager
    ADD CONSTRAINT projectmanager_email_key UNIQUE (email);
 Q   ALTER TABLE ONLY public.projectmanager DROP CONSTRAINT projectmanager_email_key;
       public            postgres    false    220            J           2606    17234 "   projectmanager projectmanager_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.projectmanager
    ADD CONSTRAINT projectmanager_pkey PRIMARY KEY (manager_id);
 L   ALTER TABLE ONLY public.projectmanager DROP CONSTRAINT projectmanager_pkey;
       public            postgres    false    220            L           2606    17236    tester tester_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.tester
    ADD CONSTRAINT tester_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.tester DROP CONSTRAINT tester_email_key;
       public            postgres    false    223            N           2606    17238    tester tester_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tester
    ADD CONSTRAINT tester_pkey PRIMARY KEY (tester_id);
 <   ALTER TABLE ONLY public.tester DROP CONSTRAINT tester_pkey;
       public            postgres    false    223            P           2606    17240 "   testingrequest testingrequest_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.testingrequest
    ADD CONSTRAINT testingrequest_pkey PRIMARY KEY (request_id);
 L   ALTER TABLE ONLY public.testingrequest DROP CONSTRAINT testingrequest_pkey;
       public            postgres    false    226            Q           2606    17241    bug bug_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 B   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_customer_id_fkey;
       public          postgres    false    218    4678    215            R           2606    17246    bug bug_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.testingrequest(request_id);
 A   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_request_id_fkey;
       public          postgres    false    4688    215    226            S           2606    17251    bug bug_tester_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 @   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_tester_id_fkey;
       public          postgres    false    223    4686    215            T           2606    17256 6   request_acceptance request_acceptance_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 `   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_customer_id_fkey;
       public          postgres    false    218    4678    222            U           2606    17261 5   request_acceptance request_acceptance_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.testingrequest(request_id);
 _   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_request_id_fkey;
       public          postgres    false    222    4688    226            V           2606    17266 4   request_acceptance request_acceptance_tester_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 ^   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_tester_id_fkey;
       public          postgres    false    222    4686    223            W           2606    17271 @   testing_request_history testing_request_history_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing_request_history
    ADD CONSTRAINT testing_request_history_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 j   ALTER TABLE ONLY public.testing_request_history DROP CONSTRAINT testing_request_history_customer_id_fkey;
       public          postgres    false    218    225    4678            X           2606    17281 >   testing_request_history testing_request_history_tester_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing_request_history
    ADD CONSTRAINT testing_request_history_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 h   ALTER TABLE ONLY public.testing_request_history DROP CONSTRAINT testing_request_history_tester_id_fkey;
       public          postgres    false    223    225    4686            Y           2606    17286 .   testingrequest testingrequest_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testingrequest
    ADD CONSTRAINT testingrequest_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 X   ALTER TABLE ONLY public.testingrequest DROP CONSTRAINT testingrequest_customer_id_fkey;
       public          postgres    false    226    218    4678            �      x������ � �      �      x������ � �      �   �   x�3�t.-.��M-R0�L�2R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹����7�������S�|��&p�M�g~� �	z�      �   n   x�3�(��JM.Q�M�KLO-R0�̅�R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹b���� ;� �      �      x������ � �      �   �   x�3�I-.I-R0�,3R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹�`fA�6����0���fS�l��&P�M�gv� w�s�      �   '   x�3�,J-4�����̼t��܂�Ԓ��=... ��	�      �      x������ � �     