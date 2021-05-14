--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: API_abtest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_abtest" (
    id integer NOT NULL,
    title character varying(10000) NOT NULL,
    created_by character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    ended_at timestamp with time zone,
    summary character varying(10000),
    parent_mlalgorithm_1_id integer NOT NULL,
    parent_mlalgorithm_2_id integer NOT NULL
);


ALTER TABLE public."API_abtest" OWNER TO postgres;

--
-- Name: API_abtest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_abtest_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_abtest_id_seq" OWNER TO postgres;

--
-- Name: API_abtest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_abtest_id_seq" OWNED BY public."API_abtest".id;


--
-- Name: API_endpoint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_endpoint" (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    owner character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public."API_endpoint" OWNER TO postgres;

--
-- Name: API_endpoint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_endpoint_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_endpoint_id_seq" OWNER TO postgres;

--
-- Name: API_endpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_endpoint_id_seq" OWNED BY public."API_endpoint".id;


--
-- Name: API_heartd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_heartd" (
    id integer NOT NULL,
    age integer NOT NULL,
    sex character varying(6) NOT NULL,
    cp integer NOT NULL,
    trestbps integer NOT NULL,
    chol integer NOT NULL,
    fbs integer NOT NULL,
    restecg integer NOT NULL,
    thalach integer NOT NULL,
    exang integer NOT NULL,
    oldpeak integer NOT NULL,
    slope integer NOT NULL,
    ca integer NOT NULL,
    thal integer NOT NULL
);


ALTER TABLE public."API_heartd" OWNER TO postgres;

--
-- Name: API_heartd_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_heartd_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_heartd_id_seq" OWNER TO postgres;

--
-- Name: API_heartd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_heartd_id_seq" OWNED BY public."API_heartd".id;


--
-- Name: API_mlalgorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_mlalgorithm" (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(1000) NOT NULL,
    code character varying(50000) NOT NULL,
    version character varying(128) NOT NULL,
    owner character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    parent_endpoint_id integer NOT NULL
);


ALTER TABLE public."API_mlalgorithm" OWNER TO postgres;

--
-- Name: API_mlalgorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_mlalgorithm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_mlalgorithm_id_seq" OWNER TO postgres;

--
-- Name: API_mlalgorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_mlalgorithm_id_seq" OWNED BY public."API_mlalgorithm".id;


--
-- Name: API_mlalgorithmstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_mlalgorithmstatus" (
    id integer NOT NULL,
    status character varying(128) NOT NULL,
    active boolean NOT NULL,
    created_by character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    parent_mlalgorithm_id integer NOT NULL
);


ALTER TABLE public."API_mlalgorithmstatus" OWNER TO postgres;

--
-- Name: API_mlalgorithmstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_mlalgorithmstatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_mlalgorithmstatus_id_seq" OWNER TO postgres;

--
-- Name: API_mlalgorithmstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_mlalgorithmstatus_id_seq" OWNED BY public."API_mlalgorithmstatus".id;


--
-- Name: API_mlrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."API_mlrequest" (
    id integer NOT NULL,
    input_data character varying(10000) NOT NULL,
    full_response character varying(10000) NOT NULL,
    response character varying(10000) NOT NULL,
    feedback character varying(10000),
    created_at timestamp with time zone NOT NULL,
    parent_mlalgorithm_id integer NOT NULL
);


ALTER TABLE public."API_mlrequest" OWNER TO postgres;

--
-- Name: API_mlrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."API_mlrequest_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."API_mlrequest_id_seq" OWNER TO postgres;

--
-- Name: API_mlrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."API_mlrequest_id_seq" OWNED BY public."API_mlrequest".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: API_abtest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_abtest" ALTER COLUMN id SET DEFAULT nextval('public."API_abtest_id_seq"'::regclass);


--
-- Name: API_endpoint id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_endpoint" ALTER COLUMN id SET DEFAULT nextval('public."API_endpoint_id_seq"'::regclass);


--
-- Name: API_heartd id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_heartd" ALTER COLUMN id SET DEFAULT nextval('public."API_heartd_id_seq"'::regclass);


--
-- Name: API_mlalgorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithm" ALTER COLUMN id SET DEFAULT nextval('public."API_mlalgorithm_id_seq"'::regclass);


--
-- Name: API_mlalgorithmstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithmstatus" ALTER COLUMN id SET DEFAULT nextval('public."API_mlalgorithmstatus_id_seq"'::regclass);


--
-- Name: API_mlrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlrequest" ALTER COLUMN id SET DEFAULT nextval('public."API_mlrequest_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: API_abtest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_abtest" (id, title, created_by, created_at, ended_at, summary, parent_mlalgorithm_1_id, parent_mlalgorithm_2_id) FROM stdin;
1	Zaebalo	07.10.2020	2020-10-07 14:58:35.154646+03	\N	\N	1	2
\.


--
-- Data for Name: API_endpoint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_endpoint" (id, name, owner, created_at) FROM stdin;
1	classifier	Piotr	2020-10-07 11:37:35.215734+03
\.


--
-- Data for Name: API_heartd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_heartd" (id, age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal) FROM stdin;
3	22	Male	12	32	12	213	13	21	32	12	12	12	12
4	34	Male	32	324	23	23	23	23	23	23	23	23	23
5	53	Female	12	312	321	12	231	12	321	123	123	231	23
6	8	Male	25	23	12	321	12	321	12	32	12	32	432
7	123	Male	1111	1111	111	111	111	111	111	111	111	111	111
\.


--
-- Data for Name: API_mlalgorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_mlalgorithm" (id, name, description, code, version, owner, created_at, parent_endpoint_id) FROM stdin;
1	Models	Models with simple pre- and post-processing	class Models:\n    def __init__(self):\n        path_to_log = os.path.join(settings.BASE_DIR,r"research/model/logreg.pkl")\n        #path_to_grad = r"C:\\Users\\MiAir\\data_sc\\github\\heart\\research\\model\\gradient_boosting.pkl"\n        #path_to_ada = r"C:\\Users\\MiAir\\data_sc\\github\\heart\\research\\model\\Ada_Boost.pkl"\n        #path_to_lgbm = r"C:\\Users\\MiAir\\data_sc\\github\\heart\\research\\model\\modelL.pkl"\n        self.encoders = LabelEncoder()\n        self.log = joblib.load(path_to_log)\n        #self.grad = joblib.load(path_to_grad)\n        #self.ada = joblib.load(path_to_ada)\n        #self.lgbm = joblib.load(path_to_lgbm)\n\n    def preprocessing(self, input_data):\n        # JSON to pandas DataFrame\n        input_data = pd.DataFrame(input_data, index=[0])\n        input_data['age2'] = input_data['age'] // 10\n        input_data['trestbps2'] = input_data['trestbps'] // 10\n        input_data['chol2'] = input_data['chol'] // 40\n        input_data['thalach2'] = input_data['thalach'] // 40\n        input_data['oldpeak2'] = input_data['oldpeak'] // 0.4\n        for i in ['sex', 'age2', 'fbs', 'restecg', 'exang', 'thal', ]:\n            for j in ['cp', 'trestbps2', 'chol2', 'thalach2', 'oldpeak2', 'slope', 'ca']:\n                input_data[i + "_" + j] = input_data[i].astype('str') + "_" + input_data[j].astype('str')\n        # convert categoricals\n        categorical_columns = []\n        numerics = ['int8', 'int16', 'int32', 'int64', 'float16', 'float32', 'float64']\n        features = input_data.columns.values.tolist()\n        for col in features:\n            if input_data[col].dtype in numerics: continue\n            categorical_columns.append(col)\n\n        for col in categorical_columns:\n            if col in input_data.columns:\n                le = LabelEncoder()\n                le.fit(list(input_data[col].astype(str).values))\n                input_data[col] = le.transform(list(input_data[col].astype(str).values))\n\n        scaler2 = StandardScaler()\n        train0 = pd.DataFrame(scaler2.fit_transform(input_data), columns=input_data.columns)\n        return train0\n\n    def predict(self, input_data):\n        # a, b, c, d = self.log.predict_proba(input_data), self.grad.predict_proba(input_data), \\\n        #              self.ada.predict_proba(input_data), self.lgbm.predict_proba(input_data)\n        #max([a[1], b[1], c[1], d[1]])\n        return self.log.predict_proba(input_data)\n\n    def postprocessing(self, input_data):\n        label = "No Disease"\n        if input_data[1] > 0.5:\n            label = "Disease"\n        return {"probability": input_data[1], "label": label, "status": "OK"}\n\n    def compute_prediction(self, input_data):\n        try:\n            input_data = self.preprocessing(input_data)\n            prediction = self.predict(input_data)[0]  # only one sample\n            prediction = self.postprocessing(prediction)\n        except Exception as e:\n            return {"status": "Error", "message": str(e)}\n\n        return prediction\n	0.0.1	Piotr	2020-10-07 11:37:35.225736+03	1
2	Ada	Extra Trees with simple pre- and post-processing	class Ada:\n    def __init__(self):\n        path_to_ada =  os.path.join(settings.BASE_DIR, r"research/model/Ada_Boost.pkl")\n        self.encoders = LabelEncoder()\n        self.ada = joblib.load(path_to_ada)\n\n    def preprocessing(self, input_data):\n        # JSON to pandas DataFrame\n        input_data = pd.DataFrame(input_data, index=[0])\n        input_data['age2'] = input_data['age'] // 10\n        input_data['trestbps2'] = input_data['trestbps'] // 10\n        input_data['chol2'] = input_data['chol'] // 40\n        input_data['thalach2'] = input_data['thalach'] // 40\n        input_data['oldpeak2'] = input_data['oldpeak'] // 0.4\n        for i in ['sex', 'age2', 'fbs', 'restecg', 'exang', 'thal', ]:\n            for j in ['cp', 'trestbps2', 'chol2', 'thalach2', 'oldpeak2', 'slope', 'ca']:\n                input_data[i + "_" + j] = input_data[i].astype('str') + "_" + input_data[j].astype('str')\n        # convert categoricals\n        categorical_columns = []\n        numerics = ['int8', 'int16', 'int32', 'int64', 'float16', 'float32', 'float64']\n        features = input_data.columns.values.tolist()\n        for col in features:\n            if input_data[col].dtype in numerics: continue\n            categorical_columns.append(col)\n\n        for col in categorical_columns:\n            if col in input_data.columns:\n                le = LabelEncoder()\n                le.fit(list(input_data[col].astype(str).values))\n                input_data[col] = le.transform(list(input_data[col].astype(str).values))\n\n        scaler2 = StandardScaler()\n        train0 = pd.DataFrame(scaler2.fit_transform(input_data), columns=input_data.columns)\n        return train0\n\n    def predict(self, input_data):\n        return self.ada.predict_proba(input_data)\n\n    def postprocessing(self, input_data):\n        label = "No Disease"\n        if input_data[1] > 0.5:\n            label = "Disease"\n        return {"probability": input_data[1], "label": label, "status": "OK"}\n\n    def compute_prediction(self, input_data):\n        try:\n            input_data = self.preprocessing(input_data)\n            prediction = self.predict(input_data)[0]  # only one sample\n            prediction = self.postprocessing(prediction)\n        except Exception as e:\n            return {"status": "Error", "message": str(e)}\n\n        return prediction\n	0.0.1	Piotr	2020-10-07 11:37:35.310733+03	1
\.


--
-- Data for Name: API_mlalgorithmstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_mlalgorithmstatus" (id, status, active, created_by, created_at, parent_mlalgorithm_id) FROM stdin;
3	ab_testing	t	07.10.2020	2020-10-07 14:58:35.160681+03	1
1	production	f	Piotr	2020-10-07 11:37:35.230736+03	1
4	ab_testing	t	07.10.2020	2020-10-07 14:58:35.169731+03	2
2	testing	f	Piotr	2020-10-07 11:37:35.311733+03	2
\.


--
-- Data for Name: API_mlrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."API_mlrequest" (id, input_data, full_response, response, feedback, created_at, parent_mlalgorithm_id) FROM stdin;
1	{"age": 63, "sex": 1, "cp": 3, "trestbps": 145, "chol": 233, "fbs": 1, "restecg": 0, "thalach": 150, "exang": 0, "oldpeak": 2.3, "slope": 0, "ca": 0, "thal": 1}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 14:47:03.960531+03	1
2	{"age": 63, "sex": 1, "cp": 3, "trestbps": 145, "chol": 233, "fbs": 1, "restecg": 0, "thalach": 150, "exang": 0, "oldpeak": 2.3, "slope": 0, "ca": 0, "thal": 1}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 14:47:30.934997+03	1
3	{"age": 64.0, "sex": 0.0, "cp": 2.0, "trestbps": 140.0, "chol": 313.0, "fbs": 0.0, "restecg": 1.0, "thalach": 133.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:39.860492+03	1
4	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 150.0, "chol": 247.0, "fbs": 0.0, "restecg": 1.0, "thalach": 171.0, "exang": 0.0, "oldpeak": 1.5, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:46.508395+03	1
5	{"age": 64.0, "sex": 0.0, "cp": 2.0, "trestbps": 140.0, "chol": 313.0, "fbs": 0.0, "restecg": 1.0, "thalach": 133.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:46.680878+03	2
6	{"age": 63.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 195.0, "fbs": 0.0, "restecg": 1.0, "thalach": 179.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:46.949439+03	2
7	{"age": 52.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 212.0, "fbs": 0.0, "restecg": 1.0, "thalach": 168.0, "exang": 0.0, "oldpeak": 1.0, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.111478+03	2
8	{"age": 52.0, "sex": 1.0, "cp": 2.0, "trestbps": 138.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 4.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.260443+03	1
9	{"age": 60.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 178.0, "fbs": 1.0, "restecg": 1.0, "thalach": 96.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.419444+03	1
10	{"age": 64.0, "sex": 1.0, "cp": 3.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 0.0, "thalach": 144.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.582491+03	1
11	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 128.0, "chol": 259.0, "fbs": 0.0, "restecg": 0.0, "thalach": 130.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.758477+03	2
12	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 165.0, "chol": 289.0, "fbs": 1.0, "restecg": 0.0, "thalach": 124.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 3.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:47.941439+03	2
13	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 157.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:48.098439+03	2
14	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 237.0, "fbs": 0.0, "restecg": 1.0, "thalach": 71.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:48.250048+03	2
15	{"age": 56.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 294.0, "fbs": 0.0, "restecg": 0.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 1.3, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:48.402047+03	2
16	{"age": 67.0, "sex": 0.0, "cp": 0.0, "trestbps": 106.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 142.0, "exang": 0.0, "oldpeak": 0.3, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:48.66861+03	1
17	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 200.0, "chol": 288.0, "fbs": 1.0, "restecg": 0.0, "thalach": 133.0, "exang": 1.0, "oldpeak": 4.0, "slope": 0.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:48.843607+03	2
18	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 114.0, "chol": 318.0, "fbs": 0.0, "restecg": 2.0, "thalach": 140.0, "exang": 0.0, "oldpeak": 4.4, "slope": 0.0, "ca": 3.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.006608+03	1
19	{"age": 74.0, "sex": 0.0, "cp": 1.0, "trestbps": 120.0, "chol": 269.0, "fbs": 0.0, "restecg": 0.0, "thalach": 121.0, "exang": 1.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.159614+03	2
20	{"age": 38.0, "sex": 1.0, "cp": 3.0, "trestbps": 120.0, "chol": 231.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 1.0, "oldpeak": 3.8, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.326607+03	1
21	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 264.0, "fbs": 0.0, "restecg": 0.0, "thalach": 143.0, "exang": 0.0, "oldpeak": 0.4, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.479646+03	1
22	{"age": 58.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 284.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.624592+03	1
23	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 177.0, "fbs": 0.0, "restecg": 0.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 2.5, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:49.925002+03	2
24	{"age": 35.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 183.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 1.4, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.088003+03	2
25	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 126.0, "fbs": 1.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.243003+03	2
26	{"age": 61.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 243.0, "fbs": 1.0, "restecg": 1.0, "thalach": 137.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.392005+03	1
27	{"age": 42.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 295.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.541329+03	2
28	{"age": 46.0, "sex": 1.0, "cp": 0.0, "trestbps": 140.0, "chol": 311.0, "fbs": 0.0, "restecg": 1.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.699292+03	2
29	{"age": 34.0, "sex": 0.0, "cp": 1.0, "trestbps": 118.0, "chol": 210.0, "fbs": 0.0, "restecg": 1.0, "thalach": 192.0, "exang": 0.0, "oldpeak": 0.7, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:50.854293+03	2
30	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 134.0, "chol": 409.0, "fbs": 0.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.9, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.005987+03	2
31	{"age": 59.0, "sex": 1.0, "cp": 3.0, "trestbps": 134.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.149449+03	1
32	{"age": 59.0, "sex": 1.0, "cp": 1.0, "trestbps": 140.0, "chol": 221.0, "fbs": 0.0, "restecg": 1.0, "thalach": 164.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.320415+03	2
33	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.479414+03	1
34	{"age": 42.0, "sex": 1.0, "cp": 3.0, "trestbps": 148.0, "chol": 244.0, "fbs": 0.0, "restecg": 0.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.633451+03	2
35	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 132.0, "chol": 184.0, "fbs": 0.0, "restecg": 0.0, "thalach": 105.0, "exang": 1.0, "oldpeak": 2.1, "slope": 1.0, "ca": 1.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.780652+03	1
36	{"age": 63.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 254.0, "fbs": 0.0, "restecg": 0.0, "thalach": 147.0, "exang": 0.0, "oldpeak": 1.4, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:51.930648+03	1
37	{"age": 48.0, "sex": 0.0, "cp": 2.0, "trestbps": 130.0, "chol": 275.0, "fbs": 0.0, "restecg": 1.0, "thalach": 139.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:52.226481+03	1
38	{"age": 56.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 236.0, "fbs": 0.0, "restecg": 1.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:52.374096+03	1
39	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 110.0, "chol": 235.0, "fbs": 0.0, "restecg": 1.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:52.629364+03	1
40	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 229.0, "fbs": 0.0, "restecg": 0.0, "thalach": 129.0, "exang": 1.0, "oldpeak": 2.6, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:52.782078+03	2
41	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 160.0, "chol": 228.0, "fbs": 0.0, "restecg": 0.0, "thalach": 138.0, "exang": 0.0, "oldpeak": 2.3, "slope": 2.0, "ca": 0.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:52.939081+03	1
42	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 112.0, "chol": 212.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 0.1, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.101081+03	1
43	{"age": 54.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 232.0, "fbs": 0.0, "restecg": 0.0, "thalach": 165.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.26904+03	2
44	{"age": 58.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 131.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.416082+03	1
45	{"age": 65.0, "sex": 0.0, "cp": 2.0, "trestbps": 160.0, "chol": 360.0, "fbs": 0.0, "restecg": 0.0, "thalach": 151.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.573314+03	2
46	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 108.0, "chol": 141.0, "fbs": 0.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.727273+03	1
47	{"age": 47.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 275.0, "fbs": 0.0, "restecg": 0.0, "thalach": 118.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:53.88228+03	1
48	{"age": 42.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.037276+03	1
49	{"age": 57.0, "sex": 0.0, "cp": 0.0, "trestbps": 128.0, "chol": 303.0, "fbs": 0.0, "restecg": 0.0, "thalach": 159.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.205275+03	2
50	{"age": 47.0, "sex": 1.0, "cp": 2.0, "trestbps": 108.0, "chol": 243.0, "fbs": 0.0, "restecg": 1.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.376315+03	2
51	{"age": 68.0, "sex": 1.0, "cp": 0.0, "trestbps": 144.0, "chol": 193.0, "fbs": 1.0, "restecg": 1.0, "thalach": 141.0, "exang": 0.0, "oldpeak": 3.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.520275+03	1
52	{"age": 43.0, "sex": 0.0, "cp": 0.0, "trestbps": 132.0, "chol": 341.0, "fbs": 1.0, "restecg": 0.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.690275+03	1
53	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 206.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 2.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:54.858316+03	1
54	{"age": 42.0, "sex": 1.0, "cp": 2.0, "trestbps": 120.0, "chol": 240.0, "fbs": 1.0, "restecg": 1.0, "thalach": 194.0, "exang": 0.0, "oldpeak": 0.8, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.008275+03	1
55	{"age": 53.0, "sex": 1.0, "cp": 2.0, "trestbps": 130.0, "chol": 197.0, "fbs": 1.0, "restecg": 0.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 1.2, "slope": 0.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.159312+03	1
56	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.308316+03	1
57	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 283.0, "fbs": 1.0, "restecg": 0.0, "thalach": 103.0, "exang": 1.0, "oldpeak": 1.6, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.580552+03	2
58	{"age": 44.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 235.0, "fbs": 0.0, "restecg": 0.0, "thalach": 180.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.764515+03	1
59	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 168.0, "fbs": 0.0, "restecg": 1.0, "thalach": 174.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:55.917513+03	2
60	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 335.0, "fbs": 0.0, "restecg": 1.0, "thalach": 143.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.068669+03	1
61	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 118.0, "chol": 242.0, "fbs": 0.0, "restecg": 1.0, "thalach": 149.0, "exang": 0.0, "oldpeak": 0.3, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.232631+03	2
62	{"age": 70.0, "sex": 1.0, "cp": 2.0, "trestbps": 160.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 112.0, "exang": 1.0, "oldpeak": 2.9, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.375634+03	1
63	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 140.0, "chol": 268.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 3.6, "slope": 0.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.519977+03	1
64	{"age": 48.0, "sex": 1.0, "cp": 2.0, "trestbps": 124.0, "chol": 255.0, "fbs": 1.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.667188+03	1
65	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:56.822226+03	2
66	{"age": 46.0, "sex": 0.0, "cp": 1.0, "trestbps": 105.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.006287+03	1
67	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 234.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.165283+03	2
68	{"age": 58.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 340.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.328244+03	2
69	{"age": 63.0, "sex": 0.0, "cp": 2.0, "trestbps": 135.0, "chol": 252.0, "fbs": 0.0, "restecg": 0.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.486246+03	2
70	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 108.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.633245+03	1
71	{"age": 77.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 304.0, "fbs": 0.0, "restecg": 0.0, "thalach": 162.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 3.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.788243+03	2
72	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 254.0, "fbs": 1.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.2, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:57.948247+03	1
73	{"age": 45.0, "sex": 1.0, "cp": 0.0, "trestbps": 104.0, "chol": 208.0, "fbs": 0.0, "restecg": 0.0, "thalach": 148.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:58.219506+03	2
74	{"age": 40.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 167.0, "fbs": 0.0, "restecg": 0.0, "thalach": 114.0, "exang": 1.0, "oldpeak": 2.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:58.381631+03	2
75	{"age": 54.0, "sex": 1.0, "cp": 0.0, "trestbps": 124.0, "chol": 266.0, "fbs": 0.0, "restecg": 0.0, "thalach": 109.0, "exang": 1.0, "oldpeak": 2.2, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:58.552629+03	2
76	{"age": 68.0, "sex": 1.0, "cp": 2.0, "trestbps": 180.0, "chol": 274.0, "fbs": 1.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.6, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:58.71767+03	1
77	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 117.0, "chol": 230.0, "fbs": 1.0, "restecg": 1.0, "thalach": 160.0, "exang": 1.0, "oldpeak": 1.4, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:58.865632+03	1
78	{"age": 39.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 321.0, "fbs": 0.0, "restecg": 0.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:59.015437+03	1
79	{"age": 61.0, "sex": 1.0, "cp": 0.0, "trestbps": 148.0, "chol": 203.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:32:59.158437+03	1
80	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 150.0, "chol": 247.0, "fbs": 0.0, "restecg": 1.0, "thalach": 171.0, "exang": 0.0, "oldpeak": 1.5, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:13.268156+03	2
81	{"age": 64.0, "sex": 0.0, "cp": 2.0, "trestbps": 140.0, "chol": 313.0, "fbs": 0.0, "restecg": 1.0, "thalach": 133.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:13.44516+03	1
82	{"age": 63.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 195.0, "fbs": 0.0, "restecg": 1.0, "thalach": 179.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:13.594158+03	1
83	{"age": 52.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 212.0, "fbs": 0.0, "restecg": 1.0, "thalach": 168.0, "exang": 0.0, "oldpeak": 1.0, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:13.738382+03	1
84	{"age": 52.0, "sex": 1.0, "cp": 2.0, "trestbps": 138.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 4.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:13.891322+03	1
85	{"age": 60.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 178.0, "fbs": 1.0, "restecg": 1.0, "thalach": 96.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.047365+03	1
86	{"age": 64.0, "sex": 1.0, "cp": 3.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 0.0, "thalach": 144.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.202324+03	1
87	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 128.0, "chol": 259.0, "fbs": 0.0, "restecg": 0.0, "thalach": 130.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.344361+03	1
88	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 165.0, "chol": 289.0, "fbs": 1.0, "restecg": 0.0, "thalach": 124.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 3.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.509429+03	2
89	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 157.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.673394+03	2
90	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 237.0, "fbs": 0.0, "restecg": 1.0, "thalach": 71.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.82639+03	2
91	{"age": 56.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 294.0, "fbs": 0.0, "restecg": 0.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 1.3, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:14.97543+03	2
92	{"age": 67.0, "sex": 0.0, "cp": 0.0, "trestbps": 106.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 142.0, "exang": 0.0, "oldpeak": 0.3, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:15.258178+03	2
93	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 200.0, "chol": 288.0, "fbs": 1.0, "restecg": 0.0, "thalach": 133.0, "exang": 1.0, "oldpeak": 4.0, "slope": 0.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:15.41414+03	2
94	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 114.0, "chol": 318.0, "fbs": 0.0, "restecg": 2.0, "thalach": 140.0, "exang": 0.0, "oldpeak": 4.4, "slope": 0.0, "ca": 3.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:15.570143+03	1
95	{"age": 74.0, "sex": 0.0, "cp": 1.0, "trestbps": 120.0, "chol": 269.0, "fbs": 0.0, "restecg": 0.0, "thalach": 121.0, "exang": 1.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:15.721139+03	2
96	{"age": 38.0, "sex": 1.0, "cp": 3.0, "trestbps": 120.0, "chol": 231.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 1.0, "oldpeak": 3.8, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:15.86354+03	1
97	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 264.0, "fbs": 0.0, "restecg": 0.0, "thalach": 143.0, "exang": 0.0, "oldpeak": 0.4, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.026076+03	1
98	{"age": 58.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 284.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.290157+03	2
99	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 177.0, "fbs": 0.0, "restecg": 0.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 2.5, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.443118+03	1
100	{"age": 35.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 183.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 1.4, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.593151+03	1
101	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 126.0, "fbs": 1.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.752124+03	2
102	{"age": 61.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 243.0, "fbs": 1.0, "restecg": 1.0, "thalach": 137.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:16.915872+03	1
103	{"age": 42.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 295.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.086868+03	1
104	{"age": 46.0, "sex": 1.0, "cp": 0.0, "trestbps": 140.0, "chol": 311.0, "fbs": 0.0, "restecg": 1.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.245912+03	2
105	{"age": 34.0, "sex": 0.0, "cp": 1.0, "trestbps": 118.0, "chol": 210.0, "fbs": 0.0, "restecg": 1.0, "thalach": 192.0, "exang": 0.0, "oldpeak": 0.7, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.392875+03	2
106	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 134.0, "chol": 409.0, "fbs": 0.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.9, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.544867+03	1
107	{"age": 59.0, "sex": 1.0, "cp": 3.0, "trestbps": 134.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.70987+03	2
108	{"age": 59.0, "sex": 1.0, "cp": 1.0, "trestbps": 140.0, "chol": 221.0, "fbs": 0.0, "restecg": 1.0, "thalach": 164.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:17.873875+03	2
109	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.030911+03	2
110	{"age": 42.0, "sex": 1.0, "cp": 3.0, "trestbps": 148.0, "chol": 244.0, "fbs": 0.0, "restecg": 0.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.205907+03	2
111	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 132.0, "chol": 184.0, "fbs": 0.0, "restecg": 0.0, "thalach": 105.0, "exang": 1.0, "oldpeak": 2.1, "slope": 1.0, "ca": 1.0, "thal": 1.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.355213+03	2
112	{"age": 63.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 254.0, "fbs": 0.0, "restecg": 0.0, "thalach": 147.0, "exang": 0.0, "oldpeak": 1.4, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.507168+03	2
113	{"age": 48.0, "sex": 0.0, "cp": 2.0, "trestbps": 130.0, "chol": 275.0, "fbs": 0.0, "restecg": 1.0, "thalach": 139.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.706175+03	2
114	{"age": 56.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 236.0, "fbs": 0.0, "restecg": 1.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:18.887172+03	1
115	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 110.0, "chol": 235.0, "fbs": 0.0, "restecg": 1.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.046202+03	2
116	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 229.0, "fbs": 0.0, "restecg": 0.0, "thalach": 129.0, "exang": 1.0, "oldpeak": 2.6, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.211171+03	2
117	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 160.0, "chol": 228.0, "fbs": 0.0, "restecg": 0.0, "thalach": 138.0, "exang": 0.0, "oldpeak": 2.3, "slope": 2.0, "ca": 0.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.367176+03	1
118	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 112.0, "chol": 212.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 0.1, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.510202+03	1
119	{"age": 54.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 232.0, "fbs": 0.0, "restecg": 0.0, "thalach": 165.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.665217+03	2
120	{"age": 58.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 131.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.808113+03	1
121	{"age": 65.0, "sex": 0.0, "cp": 2.0, "trestbps": 160.0, "chol": 360.0, "fbs": 0.0, "restecg": 0.0, "thalach": 151.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:19.990608+03	2
122	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 108.0, "chol": 141.0, "fbs": 0.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:20.137616+03	1
123	{"age": 47.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 275.0, "fbs": 0.0, "restecg": 0.0, "thalach": 118.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:20.299578+03	2
124	{"age": 42.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:20.465579+03	2
125	{"age": 57.0, "sex": 0.0, "cp": 0.0, "trestbps": 128.0, "chol": 303.0, "fbs": 0.0, "restecg": 0.0, "thalach": 159.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:20.639578+03	2
126	{"age": 47.0, "sex": 1.0, "cp": 2.0, "trestbps": 108.0, "chol": 243.0, "fbs": 0.0, "restecg": 1.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:20.781621+03	1
127	{"age": 68.0, "sex": 1.0, "cp": 0.0, "trestbps": 144.0, "chol": 193.0, "fbs": 1.0, "restecg": 1.0, "thalach": 141.0, "exang": 0.0, "oldpeak": 3.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.032055+03	2
128	{"age": 43.0, "sex": 0.0, "cp": 0.0, "trestbps": 132.0, "chol": 341.0, "fbs": 1.0, "restecg": 0.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.17601+03	1
129	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 206.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 2.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.321194+03	1
130	{"age": 42.0, "sex": 1.0, "cp": 2.0, "trestbps": 120.0, "chol": 240.0, "fbs": 1.0, "restecg": 1.0, "thalach": 194.0, "exang": 0.0, "oldpeak": 0.8, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.48823+03	2
131	{"age": 53.0, "sex": 1.0, "cp": 2.0, "trestbps": 130.0, "chol": 197.0, "fbs": 1.0, "restecg": 0.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 1.2, "slope": 0.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.749195+03	2
132	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:21.895619+03	1
133	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 283.0, "fbs": 1.0, "restecg": 0.0, "thalach": 103.0, "exang": 1.0, "oldpeak": 1.6, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.044575+03	2
134	{"age": 44.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 235.0, "fbs": 0.0, "restecg": 0.0, "thalach": 180.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.2061+03	1
135	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 168.0, "fbs": 0.0, "restecg": 1.0, "thalach": 174.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.4081+03	2
136	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 335.0, "fbs": 0.0, "restecg": 1.0, "thalach": 143.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.564138+03	1
137	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 118.0, "chol": 242.0, "fbs": 0.0, "restecg": 1.0, "thalach": 149.0, "exang": 0.0, "oldpeak": 0.3, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.730099+03	2
138	{"age": 70.0, "sex": 1.0, "cp": 2.0, "trestbps": 160.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 112.0, "exang": 1.0, "oldpeak": 2.9, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:22.899102+03	2
139	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 140.0, "chol": 268.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 3.6, "slope": 0.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.063136+03	2
140	{"age": 48.0, "sex": 1.0, "cp": 2.0, "trestbps": 124.0, "chol": 255.0, "fbs": 1.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.209136+03	2
141	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.356102+03	1
142	{"age": 46.0, "sex": 0.0, "cp": 1.0, "trestbps": 105.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.527141+03	2
143	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 234.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.69266+03	1
144	{"age": 58.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 340.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:23.842345+03	2
145	{"age": 63.0, "sex": 0.0, "cp": 2.0, "trestbps": 135.0, "chol": 252.0, "fbs": 0.0, "restecg": 0.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.000166+03	1
146	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 108.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.183171+03	2
147	{"age": 77.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 304.0, "fbs": 0.0, "restecg": 0.0, "thalach": 162.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 3.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.340215+03	1
148	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 254.0, "fbs": 1.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.2, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.610119+03	2
149	{"age": 45.0, "sex": 1.0, "cp": 0.0, "trestbps": 104.0, "chol": 208.0, "fbs": 0.0, "restecg": 0.0, "thalach": 148.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.773114+03	2
150	{"age": 40.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 167.0, "fbs": 0.0, "restecg": 0.0, "thalach": 114.0, "exang": 1.0, "oldpeak": 2.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:24.923618+03	1
151	{"age": 54.0, "sex": 1.0, "cp": 0.0, "trestbps": 124.0, "chol": 266.0, "fbs": 0.0, "restecg": 0.0, "thalach": 109.0, "exang": 1.0, "oldpeak": 2.2, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:25.172121+03	2
152	{"age": 68.0, "sex": 1.0, "cp": 2.0, "trestbps": 180.0, "chol": 274.0, "fbs": 1.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.6, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:25.321075+03	1
153	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 117.0, "chol": 230.0, "fbs": 1.0, "restecg": 1.0, "thalach": 160.0, "exang": 1.0, "oldpeak": 1.4, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:25.49412+03	2
154	{"age": 39.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 321.0, "fbs": 0.0, "restecg": 0.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:25.641076+03	1
155	{"age": 61.0, "sex": 1.0, "cp": 0.0, "trestbps": 148.0, "chol": 203.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:46:25.925104+03	2
156	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 150.0, "chol": 247.0, "fbs": 0.0, "restecg": 1.0, "thalach": 171.0, "exang": 0.0, "oldpeak": 1.5, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:34.580044+03	2
157	{"age": 64.0, "sex": 0.0, "cp": 2.0, "trestbps": 140.0, "chol": 313.0, "fbs": 0.0, "restecg": 1.0, "thalach": 133.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:34.723444+03	1
158	{"age": 63.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 195.0, "fbs": 0.0, "restecg": 1.0, "thalach": 179.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:34.882445+03	2
159	{"age": 52.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 212.0, "fbs": 0.0, "restecg": 1.0, "thalach": 168.0, "exang": 0.0, "oldpeak": 1.0, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.040444+03	2
160	{"age": 52.0, "sex": 1.0, "cp": 2.0, "trestbps": 138.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 4.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.192449+03	2
161	{"age": 60.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 178.0, "fbs": 1.0, "restecg": 1.0, "thalach": 96.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.334483+03	1
162	{"age": 64.0, "sex": 1.0, "cp": 3.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 0.0, "thalach": 144.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.481486+03	1
163	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 128.0, "chol": 259.0, "fbs": 0.0, "restecg": 0.0, "thalach": 130.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.756446+03	2
164	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 165.0, "chol": 289.0, "fbs": 1.0, "restecg": 0.0, "thalach": 124.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 3.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:35.912444+03	2
165	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 157.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.074031+03	1
166	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 237.0, "fbs": 0.0, "restecg": 1.0, "thalach": 71.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.261027+03	1
167	{"age": 56.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 294.0, "fbs": 0.0, "restecg": 0.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 1.3, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.426028+03	1
168	{"age": 67.0, "sex": 0.0, "cp": 0.0, "trestbps": 106.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 142.0, "exang": 0.0, "oldpeak": 0.3, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.69571+03	2
169	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 200.0, "chol": 288.0, "fbs": 1.0, "restecg": 0.0, "thalach": 133.0, "exang": 1.0, "oldpeak": 4.0, "slope": 0.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.843311+03	1
170	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 114.0, "chol": 318.0, "fbs": 0.0, "restecg": 2.0, "thalach": 140.0, "exang": 0.0, "oldpeak": 4.4, "slope": 0.0, "ca": 3.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:36.991348+03	1
171	{"age": 74.0, "sex": 0.0, "cp": 1.0, "trestbps": 120.0, "chol": 269.0, "fbs": 0.0, "restecg": 0.0, "thalach": 121.0, "exang": 1.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.148312+03	2
172	{"age": 38.0, "sex": 1.0, "cp": 3.0, "trestbps": 120.0, "chol": 231.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 1.0, "oldpeak": 3.8, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.311308+03	2
173	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 264.0, "fbs": 0.0, "restecg": 0.0, "thalach": 143.0, "exang": 0.0, "oldpeak": 0.4, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.478308+03	2
174	{"age": 58.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 284.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.633347+03	2
175	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 177.0, "fbs": 0.0, "restecg": 0.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 2.5, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.780351+03	2
176	{"age": 35.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 183.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 1.4, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:37.934568+03	2
177	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 126.0, "fbs": 1.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.079672+03	1
178	{"age": 61.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 243.0, "fbs": 1.0, "restecg": 1.0, "thalach": 137.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.228326+03	1
179	{"age": 42.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 295.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.379252+03	2
180	{"age": 46.0, "sex": 1.0, "cp": 0.0, "trestbps": 140.0, "chol": 311.0, "fbs": 0.0, "restecg": 1.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.646242+03	2
181	{"age": 34.0, "sex": 0.0, "cp": 1.0, "trestbps": 118.0, "chol": 210.0, "fbs": 0.0, "restecg": 1.0, "thalach": 192.0, "exang": 0.0, "oldpeak": 0.7, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.82824+03	2
182	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 134.0, "chol": 409.0, "fbs": 0.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.9, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:38.986239+03	2
183	{"age": 59.0, "sex": 1.0, "cp": 3.0, "trestbps": 134.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.13128+03	1
184	{"age": 59.0, "sex": 1.0, "cp": 1.0, "trestbps": 140.0, "chol": 221.0, "fbs": 0.0, "restecg": 1.0, "thalach": 164.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.296242+03	1
185	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.442242+03	1
186	{"age": 42.0, "sex": 1.0, "cp": 3.0, "trestbps": 148.0, "chol": 244.0, "fbs": 0.0, "restecg": 0.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.627305+03	2
187	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 132.0, "chol": 184.0, "fbs": 0.0, "restecg": 0.0, "thalach": 105.0, "exang": 1.0, "oldpeak": 2.1, "slope": 1.0, "ca": 1.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.768242+03	1
188	{"age": 63.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 254.0, "fbs": 0.0, "restecg": 0.0, "thalach": 147.0, "exang": 0.0, "oldpeak": 1.4, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:39.935239+03	2
189	{"age": 48.0, "sex": 0.0, "cp": 2.0, "trestbps": 130.0, "chol": 275.0, "fbs": 0.0, "restecg": 1.0, "thalach": 139.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.107239+03	2
190	{"age": 56.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 236.0, "fbs": 0.0, "restecg": 1.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.254278+03	1
191	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 110.0, "chol": 235.0, "fbs": 0.0, "restecg": 1.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.403283+03	1
192	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 229.0, "fbs": 0.0, "restecg": 0.0, "thalach": 129.0, "exang": 1.0, "oldpeak": 2.6, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.551283+03	1
193	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 160.0, "chol": 228.0, "fbs": 0.0, "restecg": 0.0, "thalach": 138.0, "exang": 0.0, "oldpeak": 2.3, "slope": 2.0, "ca": 0.0, "thal": 1.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.716276+03	2
194	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 112.0, "chol": 212.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 0.1, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:40.977509+03	1
195	{"age": 54.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 232.0, "fbs": 0.0, "restecg": 0.0, "thalach": 165.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.12951+03	1
196	{"age": 58.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 131.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.286545+03	2
197	{"age": 65.0, "sex": 0.0, "cp": 2.0, "trestbps": 160.0, "chol": 360.0, "fbs": 0.0, "restecg": 0.0, "thalach": 151.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.46051+03	2
198	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 108.0, "chol": 141.0, "fbs": 0.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.657507+03	2
199	{"age": 47.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 275.0, "fbs": 0.0, "restecg": 0.0, "thalach": 118.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.817546+03	2
200	{"age": 42.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:41.978548+03	2
201	{"age": 57.0, "sex": 0.0, "cp": 0.0, "trestbps": 128.0, "chol": 303.0, "fbs": 0.0, "restecg": 0.0, "thalach": 159.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.12151+03	1
202	{"age": 47.0, "sex": 1.0, "cp": 2.0, "trestbps": 108.0, "chol": 243.0, "fbs": 0.0, "restecg": 1.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.29051+03	2
203	{"age": 68.0, "sex": 1.0, "cp": 0.0, "trestbps": 144.0, "chol": 193.0, "fbs": 1.0, "restecg": 1.0, "thalach": 141.0, "exang": 0.0, "oldpeak": 3.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.435406+03	1
204	{"age": 43.0, "sex": 0.0, "cp": 0.0, "trestbps": 132.0, "chol": 341.0, "fbs": 1.0, "restecg": 0.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.598409+03	1
205	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 206.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 2.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.77748+03	1
206	{"age": 42.0, "sex": 1.0, "cp": 2.0, "trestbps": 120.0, "chol": 240.0, "fbs": 1.0, "restecg": 1.0, "thalach": 194.0, "exang": 0.0, "oldpeak": 0.8, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:42.923406+03	1
207	{"age": 53.0, "sex": 1.0, "cp": 2.0, "trestbps": 130.0, "chol": 197.0, "fbs": 1.0, "restecg": 0.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 1.2, "slope": 0.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.065447+03	1
208	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.235204+03	2
209	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 283.0, "fbs": 1.0, "restecg": 0.0, "thalach": 103.0, "exang": 1.0, "oldpeak": 1.6, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.396241+03	2
210	{"age": 44.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 235.0, "fbs": 0.0, "restecg": 0.0, "thalach": 180.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.58024+03	2
211	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 168.0, "fbs": 0.0, "restecg": 1.0, "thalach": 174.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.738206+03	1
212	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 335.0, "fbs": 0.0, "restecg": 1.0, "thalach": 143.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:43.898256+03	1
213	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 118.0, "chol": 242.0, "fbs": 0.0, "restecg": 1.0, "thalach": 149.0, "exang": 0.0, "oldpeak": 0.3, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.14841+03	1
214	{"age": 70.0, "sex": 1.0, "cp": 2.0, "trestbps": 160.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 112.0, "exang": 1.0, "oldpeak": 2.9, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.309665+03	2
215	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 140.0, "chol": 268.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 3.6, "slope": 0.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.461711+03	2
216	{"age": 48.0, "sex": 1.0, "cp": 2.0, "trestbps": 124.0, "chol": 255.0, "fbs": 1.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.64806+03	1
217	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.796157+03	1
218	{"age": 46.0, "sex": 0.0, "cp": 1.0, "trestbps": 105.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:44.940162+03	1
219	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 234.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.202602+03	2
220	{"age": 58.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 340.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.342934+03	1
221	{"age": 63.0, "sex": 0.0, "cp": 2.0, "trestbps": 135.0, "chol": 252.0, "fbs": 0.0, "restecg": 0.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.487937+03	1
222	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 108.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.639972+03	2
223	{"age": 77.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 304.0, "fbs": 0.0, "restecg": 0.0, "thalach": 162.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 3.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.792667+03	2
224	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 254.0, "fbs": 1.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.2, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:45.938631+03	1
225	{"age": 45.0, "sex": 1.0, "cp": 0.0, "trestbps": 104.0, "chol": 208.0, "fbs": 0.0, "restecg": 0.0, "thalach": 148.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.089627+03	2
226	{"age": 40.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 167.0, "fbs": 0.0, "restecg": 0.0, "thalach": 114.0, "exang": 1.0, "oldpeak": 2.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.248626+03	2
227	{"age": 54.0, "sex": 1.0, "cp": 0.0, "trestbps": 124.0, "chol": 266.0, "fbs": 0.0, "restecg": 0.0, "thalach": 109.0, "exang": 1.0, "oldpeak": 2.2, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.398628+03	1
228	{"age": 68.0, "sex": 1.0, "cp": 2.0, "trestbps": 180.0, "chol": 274.0, "fbs": 1.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.6, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.540633+03	1
229	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 117.0, "chol": 230.0, "fbs": 1.0, "restecg": 1.0, "thalach": 160.0, "exang": 1.0, "oldpeak": 1.4, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.694633+03	2
230	{"age": 39.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 321.0, "fbs": 0.0, "restecg": 0.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:46.865627+03	1
231	{"age": 61.0, "sex": 1.0, "cp": 0.0, "trestbps": 148.0, "chol": 203.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 15:48:47.13463+03	2
232	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 150.0, "chol": 247.0, "fbs": 0.0, "restecg": 1.0, "thalach": 171.0, "exang": 0.0, "oldpeak": 1.5, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.025474+03	1
233	{"age": 64.0, "sex": 0.0, "cp": 2.0, "trestbps": 140.0, "chol": 313.0, "fbs": 0.0, "restecg": 1.0, "thalach": 133.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.177437+03	1
234	{"age": 63.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 195.0, "fbs": 0.0, "restecg": 1.0, "thalach": 179.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.339435+03	1
235	{"age": 52.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 212.0, "fbs": 0.0, "restecg": 1.0, "thalach": 168.0, "exang": 0.0, "oldpeak": 1.0, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.480655+03	1
236	{"age": 52.0, "sex": 1.0, "cp": 2.0, "trestbps": 138.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 4.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.634655+03	1
237	{"age": 60.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 178.0, "fbs": 1.0, "restecg": 1.0, "thalach": 96.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.792696+03	2
238	{"age": 64.0, "sex": 1.0, "cp": 3.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 0.0, "thalach": 144.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:02.946694+03	2
239	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 128.0, "chol": 259.0, "fbs": 0.0, "restecg": 0.0, "thalach": 130.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.093693+03	2
240	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 165.0, "chol": 289.0, "fbs": 1.0, "restecg": 0.0, "thalach": 124.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 3.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.243597+03	2
241	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 157.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.407644+03	2
242	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 237.0, "fbs": 0.0, "restecg": 1.0, "thalach": 71.0, "exang": 0.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.563644+03	2
243	{"age": 56.0, "sex": 0.0, "cp": 1.0, "trestbps": 140.0, "chol": 294.0, "fbs": 0.0, "restecg": 0.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 1.3, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.717694+03	2
244	{"age": 67.0, "sex": 0.0, "cp": 0.0, "trestbps": 106.0, "chol": 223.0, "fbs": 0.0, "restecg": 1.0, "thalach": 142.0, "exang": 0.0, "oldpeak": 0.3, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:03.87022+03	2
245	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 200.0, "chol": 288.0, "fbs": 1.0, "restecg": 0.0, "thalach": 133.0, "exang": 1.0, "oldpeak": 4.0, "slope": 0.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.018218+03	1
246	{"age": 58.0, "sex": 1.0, "cp": 0.0, "trestbps": 114.0, "chol": 318.0, "fbs": 0.0, "restecg": 2.0, "thalach": 140.0, "exang": 0.0, "oldpeak": 4.4, "slope": 0.0, "ca": 3.0, "thal": 1.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.198724+03	2
247	{"age": 74.0, "sex": 0.0, "cp": 1.0, "trestbps": 120.0, "chol": 269.0, "fbs": 0.0, "restecg": 0.0, "thalach": 121.0, "exang": 1.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.368723+03	2
248	{"age": 38.0, "sex": 1.0, "cp": 3.0, "trestbps": 120.0, "chol": 231.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 1.0, "oldpeak": 3.8, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.594724+03	1
249	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 264.0, "fbs": 0.0, "restecg": 0.0, "thalach": 143.0, "exang": 0.0, "oldpeak": 0.4, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.828721+03	2
250	{"age": 58.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 284.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 1.8, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:04.97876+03	2
251	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 177.0, "fbs": 0.0, "restecg": 0.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 2.5, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.128408+03	2
252	{"age": 35.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 183.0, "fbs": 0.0, "restecg": 1.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 1.4, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.276414+03	1
253	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 126.0, "fbs": 1.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.423373+03	1
254	{"age": 61.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 243.0, "fbs": 1.0, "restecg": 1.0, "thalach": 137.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.564413+03	1
255	{"age": 42.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 295.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.712376+03	2
256	{"age": 46.0, "sex": 1.0, "cp": 0.0, "trestbps": 140.0, "chol": 311.0, "fbs": 0.0, "restecg": 1.0, "thalach": 120.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:05.853691+03	1
257	{"age": 34.0, "sex": 0.0, "cp": 1.0, "trestbps": 118.0, "chol": 210.0, "fbs": 0.0, "restecg": 1.0, "thalach": 192.0, "exang": 0.0, "oldpeak": 0.7, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.00269+03	1
258	{"age": 56.0, "sex": 0.0, "cp": 0.0, "trestbps": 134.0, "chol": 409.0, "fbs": 0.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.9, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.152692+03	1
259	{"age": 59.0, "sex": 1.0, "cp": 3.0, "trestbps": 134.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 162.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.295726+03	1
260	{"age": 59.0, "sex": 1.0, "cp": 1.0, "trestbps": 140.0, "chol": 221.0, "fbs": 0.0, "restecg": 1.0, "thalach": 164.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.45085+03	2
261	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.599848+03	2
262	{"age": 42.0, "sex": 1.0, "cp": 3.0, "trestbps": 148.0, "chol": 244.0, "fbs": 0.0, "restecg": 0.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.753914+03	2
263	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 132.0, "chol": 184.0, "fbs": 0.0, "restecg": 0.0, "thalach": 105.0, "exang": 1.0, "oldpeak": 2.1, "slope": 1.0, "ca": 1.0, "thal": 1.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:06.896183+03	1
264	{"age": 63.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 254.0, "fbs": 0.0, "restecg": 0.0, "thalach": 147.0, "exang": 0.0, "oldpeak": 1.4, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.040012+03	1
265	{"age": 48.0, "sex": 0.0, "cp": 2.0, "trestbps": 130.0, "chol": 275.0, "fbs": 0.0, "restecg": 1.0, "thalach": 139.0, "exang": 0.0, "oldpeak": 0.2, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.198828+03	2
266	{"age": 56.0, "sex": 1.0, "cp": 1.0, "trestbps": 120.0, "chol": 236.0, "fbs": 0.0, "restecg": 1.0, "thalach": 178.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.441682+03	1
267	{"age": 41.0, "sex": 1.0, "cp": 1.0, "trestbps": 110.0, "chol": 235.0, "fbs": 0.0, "restecg": 1.0, "thalach": 153.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.586691+03	1
268	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 120.0, "chol": 229.0, "fbs": 0.0, "restecg": 0.0, "thalach": 129.0, "exang": 1.0, "oldpeak": 2.6, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.744681+03	2
269	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 160.0, "chol": 228.0, "fbs": 0.0, "restecg": 0.0, "thalach": 138.0, "exang": 0.0, "oldpeak": 2.3, "slope": 2.0, "ca": 0.0, "thal": 1.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:07.900685+03	2
270	{"age": 66.0, "sex": 1.0, "cp": 0.0, "trestbps": 112.0, "chol": 212.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 0.1, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.16768+03	1
271	{"age": 54.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 232.0, "fbs": 0.0, "restecg": 0.0, "thalach": 165.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.334681+03	2
272	{"age": 58.0, "sex": 0.0, "cp": 0.0, "trestbps": 130.0, "chol": 197.0, "fbs": 0.0, "restecg": 1.0, "thalach": 131.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.489714+03	2
273	{"age": 65.0, "sex": 0.0, "cp": 2.0, "trestbps": 160.0, "chol": 360.0, "fbs": 0.0, "restecg": 0.0, "thalach": 151.0, "exang": 0.0, "oldpeak": 0.8, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.645717+03	1
274	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 108.0, "chol": 141.0, "fbs": 0.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.6, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.791719+03	1
275	{"age": 47.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 275.0, "fbs": 0.0, "restecg": 0.0, "thalach": 118.0, "exang": 1.0, "oldpeak": 1.0, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:08.93868+03	1
276	{"age": 42.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 173.0, "exang": 0.0, "oldpeak": 0.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.09568+03	2
277	{"age": 57.0, "sex": 0.0, "cp": 0.0, "trestbps": 128.0, "chol": 303.0, "fbs": 0.0, "restecg": 0.0, "thalach": 159.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.256682+03	2
278	{"age": 47.0, "sex": 1.0, "cp": 2.0, "trestbps": 108.0, "chol": 243.0, "fbs": 0.0, "restecg": 1.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.432727+03	2
279	{"age": 68.0, "sex": 1.0, "cp": 0.0, "trestbps": 144.0, "chol": 193.0, "fbs": 1.0, "restecg": 1.0, "thalach": 141.0, "exang": 0.0, "oldpeak": 3.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.585682+03	1
280	{"age": 43.0, "sex": 0.0, "cp": 0.0, "trestbps": 132.0, "chol": 341.0, "fbs": 1.0, "restecg": 0.0, "thalach": 136.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.756716+03	2
281	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 206.0, "fbs": 0.0, "restecg": 0.0, "thalach": 132.0, "exang": 1.0, "oldpeak": 2.4, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:09.93968+03	1
282	{"age": 42.0, "sex": 1.0, "cp": 2.0, "trestbps": 120.0, "chol": 240.0, "fbs": 1.0, "restecg": 1.0, "thalach": 194.0, "exang": 0.0, "oldpeak": 0.8, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:10.140682+03	2
283	{"age": 53.0, "sex": 1.0, "cp": 2.0, "trestbps": 130.0, "chol": 197.0, "fbs": 1.0, "restecg": 0.0, "thalach": 152.0, "exang": 0.0, "oldpeak": 1.2, "slope": 0.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:10.307721+03	2
284	{"age": 43.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 211.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:10.579273+03	1
285	{"age": 56.0, "sex": 1.0, "cp": 0.0, "trestbps": 130.0, "chol": 283.0, "fbs": 1.0, "restecg": 0.0, "thalach": 103.0, "exang": 1.0, "oldpeak": 1.6, "slope": 0.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:10.750276+03	2
286	{"age": 44.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 235.0, "fbs": 0.0, "restecg": 0.0, "thalach": 180.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:10.900309+03	1
287	{"age": 57.0, "sex": 1.0, "cp": 2.0, "trestbps": 150.0, "chol": 168.0, "fbs": 0.0, "restecg": 1.0, "thalach": 174.0, "exang": 0.0, "oldpeak": 1.6, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.046275+03	1
288	{"age": 57.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 335.0, "fbs": 0.0, "restecg": 1.0, "thalach": 143.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.196457+03	1
289	{"age": 44.0, "sex": 0.0, "cp": 2.0, "trestbps": 118.0, "chol": 242.0, "fbs": 0.0, "restecg": 1.0, "thalach": 149.0, "exang": 0.0, "oldpeak": 0.3, "slope": 1.0, "ca": 1.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.339793+03	1
290	{"age": 70.0, "sex": 1.0, "cp": 2.0, "trestbps": 160.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 112.0, "exang": 1.0, "oldpeak": 2.9, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.490833+03	2
291	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 140.0, "chol": 268.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 3.6, "slope": 0.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.637791+03	1
292	{"age": 48.0, "sex": 1.0, "cp": 2.0, "trestbps": 124.0, "chol": 255.0, "fbs": 1.0, "restecg": 1.0, "thalach": 175.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.789792+03	2
293	{"age": 62.0, "sex": 0.0, "cp": 0.0, "trestbps": 124.0, "chol": 209.0, "fbs": 0.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:11.941829+03	2
294	{"age": 46.0, "sex": 0.0, "cp": 1.0, "trestbps": 105.0, "chol": 204.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.105834+03	2
295	{"age": 53.0, "sex": 0.0, "cp": 0.0, "trestbps": 138.0, "chol": 234.0, "fbs": 0.0, "restecg": 0.0, "thalach": 160.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.273791+03	1
296	{"age": 58.0, "sex": 0.0, "cp": 2.0, "trestbps": 120.0, "chol": 340.0, "fbs": 0.0, "restecg": 1.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.439792+03	2
297	{"age": 63.0, "sex": 0.0, "cp": 2.0, "trestbps": 135.0, "chol": 252.0, "fbs": 0.0, "restecg": 0.0, "thalach": 172.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.58879+03	2
298	{"age": 63.0, "sex": 0.0, "cp": 0.0, "trestbps": 108.0, "chol": 269.0, "fbs": 0.0, "restecg": 1.0, "thalach": 169.0, "exang": 1.0, "oldpeak": 1.8, "slope": 1.0, "ca": 2.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.740017+03	2
299	{"age": 77.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 304.0, "fbs": 0.0, "restecg": 0.0, "thalach": 162.0, "exang": 1.0, "oldpeak": 0.0, "slope": 2.0, "ca": 3.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:12.893535+03	2
300	{"age": 67.0, "sex": 1.0, "cp": 0.0, "trestbps": 125.0, "chol": 254.0, "fbs": 1.0, "restecg": 1.0, "thalach": 163.0, "exang": 0.0, "oldpeak": 0.2, "slope": 1.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.042575+03	2
301	{"age": 45.0, "sex": 1.0, "cp": 0.0, "trestbps": 104.0, "chol": 208.0, "fbs": 0.0, "restecg": 0.0, "thalach": 148.0, "exang": 1.0, "oldpeak": 3.0, "slope": 1.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.192531+03	1
302	{"age": 40.0, "sex": 1.0, "cp": 0.0, "trestbps": 110.0, "chol": 167.0, "fbs": 0.0, "restecg": 0.0, "thalach": 114.0, "exang": 1.0, "oldpeak": 2.0, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.34257+03	2
303	{"age": 54.0, "sex": 1.0, "cp": 0.0, "trestbps": 124.0, "chol": 266.0, "fbs": 0.0, "restecg": 0.0, "thalach": 109.0, "exang": 1.0, "oldpeak": 2.2, "slope": 1.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.593779+03	1
304	{"age": 68.0, "sex": 1.0, "cp": 2.0, "trestbps": 180.0, "chol": 274.0, "fbs": 1.0, "restecg": 0.0, "thalach": 150.0, "exang": 1.0, "oldpeak": 1.6, "slope": 1.0, "ca": 0.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.737777+03	1
305	{"age": 60.0, "sex": 1.0, "cp": 0.0, "trestbps": 117.0, "chol": 230.0, "fbs": 1.0, "restecg": 1.0, "thalach": 160.0, "exang": 1.0, "oldpeak": 1.4, "slope": 2.0, "ca": 2.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:13.880738+03	1
306	{"age": 39.0, "sex": 1.0, "cp": 2.0, "trestbps": 140.0, "chol": 321.0, "fbs": 0.0, "restecg": 0.0, "thalach": 182.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 0.0, "thal": 2.0}	{'probability': 0.510060009070864, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:14.038781+03	2
307	{"age": 61.0, "sex": 1.0, "cp": 0.0, "trestbps": 148.0, "chol": 203.0, "fbs": 0.0, "restecg": 1.0, "thalach": 161.0, "exang": 0.0, "oldpeak": 0.0, "slope": 2.0, "ca": 1.0, "thal": 3.0}	{'probability': 0.525094528795156, 'label': 'Disease', 'status': 'OK'}	Disease		2020-10-07 16:12:14.298707+03	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add heartd	7	add_heartd
26	Can change heartd	7	change_heartd
27	Can delete heartd	7	delete_heartd
28	Can view heartd	7	view_heartd
29	Can add endpoint	8	add_endpoint
30	Can change endpoint	8	change_endpoint
31	Can delete endpoint	8	delete_endpoint
32	Can view endpoint	8	view_endpoint
33	Can add ml request	9	add_mlrequest
34	Can change ml request	9	change_mlrequest
35	Can delete ml request	9	delete_mlrequest
36	Can view ml request	9	view_mlrequest
37	Can add ml algorithm	10	add_mlalgorithm
38	Can change ml algorithm	10	change_mlalgorithm
39	Can delete ml algorithm	10	delete_mlalgorithm
40	Can view ml algorithm	10	view_mlalgorithm
41	Can add ml algorithm status	11	add_mlalgorithmstatus
42	Can change ml algorithm status	11	change_mlalgorithmstatus
43	Can delete ml algorithm status	11	delete_mlalgorithmstatus
44	Can view ml algorithm status	11	view_mlalgorithmstatus
45	Can add ab test	12	add_abtest
46	Can change ab test	12	change_abtest
47	Can delete ab test	12	delete_abtest
48	Can view ab test	12	view_abtest
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$eSVZikwpm4iU$xFBwxO6cr+nJ+eOOFCO80dwlRJTEmgyiRlqmjvpQkXk=	2020-10-05 19:47:47.177737+03	t	miair				t	t	2020-10-05 19:40:56.870096+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-10-05 19:59:34.415283+03	3	22 Male	1	[{"added": {}}]	7	1
2	2020-10-05 19:59:56.383227+03	4	34 Male	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	API	heartd
8	API	endpoint
9	API	mlrequest
10	API	mlalgorithm
11	API	mlalgorithmstatus
12	API	abtest
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	API	0001_initial	2020-10-05 19:34:03.052129+03
2	contenttypes	0001_initial	2020-10-05 19:34:03.071131+03
3	auth	0001_initial	2020-10-05 19:34:03.123129+03
4	admin	0001_initial	2020-10-05 19:34:03.202129+03
5	admin	0002_logentry_remove_auto_add	2020-10-05 19:34:03.22013+03
6	admin	0003_logentry_add_action_flag_choices	2020-10-05 19:34:03.229128+03
7	contenttypes	0002_remove_content_type_name	2020-10-05 19:34:03.251126+03
8	auth	0002_alter_permission_name_max_length	2020-10-05 19:34:03.263129+03
9	auth	0003_alter_user_email_max_length	2020-10-05 19:34:03.272131+03
10	auth	0004_alter_user_username_opts	2020-10-05 19:34:03.281128+03
11	auth	0005_alter_user_last_login_null	2020-10-05 19:34:03.290128+03
12	auth	0006_require_contenttypes_0002	2020-10-05 19:34:03.292129+03
13	auth	0007_alter_validators_add_error_messages	2020-10-05 19:34:03.30013+03
14	auth	0008_alter_user_username_max_length	2020-10-05 19:34:03.32113+03
15	auth	0009_alter_user_last_name_max_length	2020-10-05 19:34:03.329128+03
16	auth	0010_alter_group_name_max_length	2020-10-05 19:34:03.341133+03
17	auth	0011_update_proxy_permissions	2020-10-05 19:34:03.35413+03
18	auth	0012_alter_user_first_name_max_length	2020-10-05 19:34:03.365129+03
19	sessions	0001_initial	2020-10-05 19:34:03.378131+03
20	API	0002_endpoint_mlalgorithm_mlalgorithmstatus_mlrequest	2020-10-06 20:23:20.344602+03
21	API	0003_abtest	2020-10-06 20:36:14.595823+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8vm0tvzmd8jfrk56qmllt9aoj8ef42d8	.eJxVjEEOwiAQRe_C2hCgTAsu3XsGMjCMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hJnEWWpx-t4jpkesO6I711mRqdV3mKHdFHrTLa6P8vBzu30HBXr41W0ZDFiYYrE_oDDtvjVMKCIwdIo6GYbJ6AM2OWZHm0VN0MUFGMEm8P8xZN6o:1kPTeN:haDBEwlVRCEs2hg_ic0H42J3CptCOsqA104Mq1pDJ6I	2020-10-19 19:47:47.180788+03
\.


--
-- Name: API_abtest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_abtest_id_seq"', 1, true);


--
-- Name: API_endpoint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_endpoint_id_seq"', 1, true);


--
-- Name: API_heartd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_heartd_id_seq"', 7, true);


--
-- Name: API_mlalgorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_mlalgorithm_id_seq"', 2, true);


--
-- Name: API_mlalgorithmstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_mlalgorithmstatus_id_seq"', 4, true);


--
-- Name: API_mlrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."API_mlrequest_id_seq"', 307, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: API_abtest API_abtest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_abtest"
    ADD CONSTRAINT "API_abtest_pkey" PRIMARY KEY (id);


--
-- Name: API_endpoint API_endpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_endpoint"
    ADD CONSTRAINT "API_endpoint_pkey" PRIMARY KEY (id);


--
-- Name: API_heartd API_heartd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_heartd"
    ADD CONSTRAINT "API_heartd_pkey" PRIMARY KEY (id);


--
-- Name: API_mlalgorithm API_mlalgorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithm"
    ADD CONSTRAINT "API_mlalgorithm_pkey" PRIMARY KEY (id);


--
-- Name: API_mlalgorithmstatus API_mlalgorithmstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithmstatus"
    ADD CONSTRAINT "API_mlalgorithmstatus_pkey" PRIMARY KEY (id);


--
-- Name: API_mlrequest API_mlrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlrequest"
    ADD CONSTRAINT "API_mlrequest_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: API_abtest_parent_mlalgorithm_1_id_ddfd97ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "API_abtest_parent_mlalgorithm_1_id_ddfd97ff" ON public."API_abtest" USING btree (parent_mlalgorithm_1_id);


--
-- Name: API_abtest_parent_mlalgorithm_2_id_23e12d31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "API_abtest_parent_mlalgorithm_2_id_23e12d31" ON public."API_abtest" USING btree (parent_mlalgorithm_2_id);


--
-- Name: API_mlalgorithm_parent_endpoint_id_9fd39afb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "API_mlalgorithm_parent_endpoint_id_9fd39afb" ON public."API_mlalgorithm" USING btree (parent_endpoint_id);


--
-- Name: API_mlalgorithmstatus_parent_mlalgorithm_id_5d226f4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "API_mlalgorithmstatus_parent_mlalgorithm_id_5d226f4c" ON public."API_mlalgorithmstatus" USING btree (parent_mlalgorithm_id);


--
-- Name: API_mlrequest_parent_mlalgorithm_id_3368f7b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "API_mlrequest_parent_mlalgorithm_id_3368f7b8" ON public."API_mlrequest" USING btree (parent_mlalgorithm_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: API_abtest API_abtest_parent_mlalgorithm_1_ddfd97ff_fk_API_mlalg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_abtest"
    ADD CONSTRAINT "API_abtest_parent_mlalgorithm_1_ddfd97ff_fk_API_mlalg" FOREIGN KEY (parent_mlalgorithm_1_id) REFERENCES public."API_mlalgorithm"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: API_abtest API_abtest_parent_mlalgorithm_2_23e12d31_fk_API_mlalg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_abtest"
    ADD CONSTRAINT "API_abtest_parent_mlalgorithm_2_23e12d31_fk_API_mlalg" FOREIGN KEY (parent_mlalgorithm_2_id) REFERENCES public."API_mlalgorithm"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: API_mlalgorithm API_mlalgorithm_parent_endpoint_id_9fd39afb_fk_API_endpoint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithm"
    ADD CONSTRAINT "API_mlalgorithm_parent_endpoint_id_9fd39afb_fk_API_endpoint_id" FOREIGN KEY (parent_endpoint_id) REFERENCES public."API_endpoint"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: API_mlalgorithmstatus API_mlalgorithmstatu_parent_mlalgorithm_i_5d226f4c_fk_API_mlalg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlalgorithmstatus"
    ADD CONSTRAINT "API_mlalgorithmstatu_parent_mlalgorithm_i_5d226f4c_fk_API_mlalg" FOREIGN KEY (parent_mlalgorithm_id) REFERENCES public."API_mlalgorithm"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: API_mlrequest API_mlrequest_parent_mlalgorithm_i_3368f7b8_fk_API_mlalg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."API_mlrequest"
    ADD CONSTRAINT "API_mlrequest_parent_mlalgorithm_i_3368f7b8_fk_API_mlalg" FOREIGN KEY (parent_mlalgorithm_id) REFERENCES public."API_mlalgorithm"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

