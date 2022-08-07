{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "0cbc66a6",
   "metadata": {},
   "outputs": [],
   "source": [
    "#importing essential libraries\n",
    "import numpy as np\n",
    "import pandas as pd\n",
    "from matplotlib import pyplot as plt\n",
    "%matplotlib inline\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "476e4cb0",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Serial No.</th>\n",
       "      <th>GRE Score</th>\n",
       "      <th>TOEFL Score</th>\n",
       "      <th>University Rating</th>\n",
       "      <th>SOP</th>\n",
       "      <th>LOR</th>\n",
       "      <th>CGPA</th>\n",
       "      <th>Research</th>\n",
       "      <th>Chance of Admit</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>337</td>\n",
       "      <td>118</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.65</td>\n",
       "      <td>1</td>\n",
       "      <td>0.92</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>324</td>\n",
       "      <td>107</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>4.5</td>\n",
       "      <td>8.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.76</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>316</td>\n",
       "      <td>104</td>\n",
       "      <td>3</td>\n",
       "      <td>3.0</td>\n",
       "      <td>3.5</td>\n",
       "      <td>8.00</td>\n",
       "      <td>1</td>\n",
       "      <td>0.72</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>322</td>\n",
       "      <td>110</td>\n",
       "      <td>3</td>\n",
       "      <td>3.5</td>\n",
       "      <td>2.5</td>\n",
       "      <td>8.67</td>\n",
       "      <td>1</td>\n",
       "      <td>0.80</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>314</td>\n",
       "      <td>103</td>\n",
       "      <td>2</td>\n",
       "      <td>2.0</td>\n",
       "      <td>3.0</td>\n",
       "      <td>8.21</td>\n",
       "      <td>0</td>\n",
       "      <td>0.65</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>...</th>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "      <td>...</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>495</th>\n",
       "      <td>496</td>\n",
       "      <td>332</td>\n",
       "      <td>108</td>\n",
       "      <td>5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.0</td>\n",
       "      <td>9.02</td>\n",
       "      <td>1</td>\n",
       "      <td>0.87</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>496</th>\n",
       "      <td>497</td>\n",
       "      <td>337</td>\n",
       "      <td>117</td>\n",
       "      <td>5</td>\n",
       "      <td>5.0</td>\n",
       "      <td>5.0</td>\n",
       "      <td>9.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.96</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>497</th>\n",
       "      <td>498</td>\n",
       "      <td>330</td>\n",
       "      <td>120</td>\n",
       "      <td>5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>5.0</td>\n",
       "      <td>9.56</td>\n",
       "      <td>1</td>\n",
       "      <td>0.93</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>498</th>\n",
       "      <td>499</td>\n",
       "      <td>312</td>\n",
       "      <td>103</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>5.0</td>\n",
       "      <td>8.43</td>\n",
       "      <td>0</td>\n",
       "      <td>0.73</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>499</th>\n",
       "      <td>500</td>\n",
       "      <td>327</td>\n",
       "      <td>113</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.04</td>\n",
       "      <td>0</td>\n",
       "      <td>0.84</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>500 rows × 9 columns</p>\n",
       "</div>"
      ],
      "text/plain": [
       "     Serial No.  GRE Score  TOEFL Score  University Rating  SOP  LOR   CGPA  \\\n",
       "0             1        337          118                  4  4.5   4.5  9.65   \n",
       "1             2        324          107                  4  4.0   4.5  8.87   \n",
       "2             3        316          104                  3  3.0   3.5  8.00   \n",
       "3             4        322          110                  3  3.5   2.5  8.67   \n",
       "4             5        314          103                  2  2.0   3.0  8.21   \n",
       "..          ...        ...          ...                ...  ...   ...   ...   \n",
       "495         496        332          108                  5  4.5   4.0  9.02   \n",
       "496         497        337          117                  5  5.0   5.0  9.87   \n",
       "497         498        330          120                  5  4.5   5.0  9.56   \n",
       "498         499        312          103                  4  4.0   5.0  8.43   \n",
       "499         500        327          113                  4  4.5   4.5  9.04   \n",
       "\n",
       "     Research  Chance of Admit   \n",
       "0           1              0.92  \n",
       "1           1              0.76  \n",
       "2           1              0.72  \n",
       "3           1              0.80  \n",
       "4           0              0.65  \n",
       "..        ...               ...  \n",
       "495         1              0.87  \n",
       "496         1              0.96  \n",
       "497         1              0.93  \n",
       "498         0              0.73  \n",
       "499         0              0.84  \n",
       "\n",
       "[500 rows x 9 columns]"
      ]
     },
     "execution_count": 2,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#loading the dataset\n",
    "df=pd.read_csv(\"admission_predict.csv\")\n",
    "df\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "bd3f2d9b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(500, 9)"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#returns number of rows and columns of te dataset\n",
    "df.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "8946a85b",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 500 entries, 0 to 499\n",
      "Data columns (total 9 columns):\n",
      " #   Column             Non-Null Count  Dtype  \n",
      "---  ------             --------------  -----  \n",
      " 0   Serial No.         500 non-null    int64  \n",
      " 1   GRE Score          500 non-null    int64  \n",
      " 2   TOEFL Score        500 non-null    int64  \n",
      " 3   University Rating  500 non-null    int64  \n",
      " 4   SOP                500 non-null    float64\n",
      " 5   LOR                500 non-null    float64\n",
      " 6   CGPA               500 non-null    float64\n",
      " 7   Research           500 non-null    int64  \n",
      " 8   Chance of Admit    500 non-null    float64\n",
      "dtypes: float64(4), int64(5)\n",
      "memory usage: 35.3 KB\n"
     ]
    }
   ],
   "source": [
    "#return basic information on all columns\n",
    "df.info()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "eb11ffa4",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>count</th>\n",
       "      <th>mean</th>\n",
       "      <th>std</th>\n",
       "      <th>min</th>\n",
       "      <th>25%</th>\n",
       "      <th>50%</th>\n",
       "      <th>75%</th>\n",
       "      <th>max</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>Serial No.</th>\n",
       "      <td>500.0</td>\n",
       "      <td>250.50000</td>\n",
       "      <td>144.481833</td>\n",
       "      <td>1.00</td>\n",
       "      <td>125.7500</td>\n",
       "      <td>250.50</td>\n",
       "      <td>375.25</td>\n",
       "      <td>500.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>GRE Score</th>\n",
       "      <td>500.0</td>\n",
       "      <td>316.47200</td>\n",
       "      <td>11.295148</td>\n",
       "      <td>290.00</td>\n",
       "      <td>308.0000</td>\n",
       "      <td>317.00</td>\n",
       "      <td>325.00</td>\n",
       "      <td>340.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>TOEFL Score</th>\n",
       "      <td>500.0</td>\n",
       "      <td>107.19200</td>\n",
       "      <td>6.081868</td>\n",
       "      <td>92.00</td>\n",
       "      <td>103.0000</td>\n",
       "      <td>107.00</td>\n",
       "      <td>112.00</td>\n",
       "      <td>120.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>University Rating</th>\n",
       "      <td>500.0</td>\n",
       "      <td>3.11400</td>\n",
       "      <td>1.143512</td>\n",
       "      <td>1.00</td>\n",
       "      <td>2.0000</td>\n",
       "      <td>3.00</td>\n",
       "      <td>4.00</td>\n",
       "      <td>5.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>SOP</th>\n",
       "      <td>500.0</td>\n",
       "      <td>3.37400</td>\n",
       "      <td>0.991004</td>\n",
       "      <td>1.00</td>\n",
       "      <td>2.5000</td>\n",
       "      <td>3.50</td>\n",
       "      <td>4.00</td>\n",
       "      <td>5.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>LOR</th>\n",
       "      <td>500.0</td>\n",
       "      <td>3.48400</td>\n",
       "      <td>0.925450</td>\n",
       "      <td>1.00</td>\n",
       "      <td>3.0000</td>\n",
       "      <td>3.50</td>\n",
       "      <td>4.00</td>\n",
       "      <td>5.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>CGPA</th>\n",
       "      <td>500.0</td>\n",
       "      <td>8.57644</td>\n",
       "      <td>0.604813</td>\n",
       "      <td>6.80</td>\n",
       "      <td>8.1275</td>\n",
       "      <td>8.56</td>\n",
       "      <td>9.04</td>\n",
       "      <td>9.92</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>Research</th>\n",
       "      <td>500.0</td>\n",
       "      <td>0.56000</td>\n",
       "      <td>0.496884</td>\n",
       "      <td>0.00</td>\n",
       "      <td>0.0000</td>\n",
       "      <td>1.00</td>\n",
       "      <td>1.00</td>\n",
       "      <td>1.00</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>Chance of Admit</th>\n",
       "      <td>500.0</td>\n",
       "      <td>0.72174</td>\n",
       "      <td>0.141140</td>\n",
       "      <td>0.34</td>\n",
       "      <td>0.6300</td>\n",
       "      <td>0.72</td>\n",
       "      <td>0.82</td>\n",
       "      <td>0.97</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "                   count       mean         std     min       25%     50%  \\\n",
       "Serial No.         500.0  250.50000  144.481833    1.00  125.7500  250.50   \n",
       "GRE Score          500.0  316.47200   11.295148  290.00  308.0000  317.00   \n",
       "TOEFL Score        500.0  107.19200    6.081868   92.00  103.0000  107.00   \n",
       "University Rating  500.0    3.11400    1.143512    1.00    2.0000    3.00   \n",
       "SOP                500.0    3.37400    0.991004    1.00    2.5000    3.50   \n",
       "LOR                500.0    3.48400    0.925450    1.00    3.0000    3.50   \n",
       "CGPA               500.0    8.57644    0.604813    6.80    8.1275    8.56   \n",
       "Research           500.0    0.56000    0.496884    0.00    0.0000    1.00   \n",
       "Chance of Admit    500.0    0.72174    0.141140    0.34    0.6300    0.72   \n",
       "\n",
       "                      75%     max  \n",
       "Serial No.         375.25  500.00  \n",
       "GRE Score          325.00  340.00  \n",
       "TOEFL Score        112.00  120.00  \n",
       "University Rating    4.00    5.00  \n",
       "SOP                  4.00    5.00  \n",
       "LOR                  4.00    5.00  \n",
       "CGPA                 9.04    9.92  \n",
       "Research             1.00    1.00  \n",
       "Chance of Admit      0.82    0.97  "
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#returns basic statistics on numeric columns\n",
    "df.describe().T"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c915e6fe",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Serial No.             int64\n",
       "GRE Score              int64\n",
       "TOEFL Score            int64\n",
       "University Rating      int64\n",
       "SOP                  float64\n",
       "LOR                  float64\n",
       "CGPA                 float64\n",
       "Research               int64\n",
       "Chance of Admit      float64\n",
       "dtype: object"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# returns diffrent datatypes for each columns\n",
    "df.dtypes"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "40e31522",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Serial No.</th>\n",
       "      <th>GRE Score</th>\n",
       "      <th>TOEFL Score</th>\n",
       "      <th>University Rating</th>\n",
       "      <th>SOP</th>\n",
       "      <th>LOR</th>\n",
       "      <th>CGPA</th>\n",
       "      <th>Research</th>\n",
       "      <th>Chance of Admit</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>337</td>\n",
       "      <td>118</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.65</td>\n",
       "      <td>1</td>\n",
       "      <td>0.92</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>324</td>\n",
       "      <td>107</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>4.5</td>\n",
       "      <td>8.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.76</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>316</td>\n",
       "      <td>104</td>\n",
       "      <td>3</td>\n",
       "      <td>3.0</td>\n",
       "      <td>3.5</td>\n",
       "      <td>8.00</td>\n",
       "      <td>1</td>\n",
       "      <td>0.72</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>322</td>\n",
       "      <td>110</td>\n",
       "      <td>3</td>\n",
       "      <td>3.5</td>\n",
       "      <td>2.5</td>\n",
       "      <td>8.67</td>\n",
       "      <td>1</td>\n",
       "      <td>0.80</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>314</td>\n",
       "      <td>103</td>\n",
       "      <td>2</td>\n",
       "      <td>2.0</td>\n",
       "      <td>3.0</td>\n",
       "      <td>8.21</td>\n",
       "      <td>0</td>\n",
       "      <td>0.65</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   Serial No.  GRE Score  TOEFL Score  University Rating  SOP  LOR   CGPA  \\\n",
       "0           1        337          118                  4  4.5   4.5  9.65   \n",
       "1           2        324          107                  4  4.0   4.5  8.87   \n",
       "2           3        316          104                  3  3.0   3.5  8.00   \n",
       "3           4        322          110                  3  3.5   2.5  8.67   \n",
       "4           5        314          103                  2  2.0   3.0  8.21   \n",
       "\n",
       "   Research  Chance of Admit   \n",
       "0         1              0.92  \n",
       "1         1              0.76  \n",
       "2         1              0.72  \n",
       "3         1              0.80  \n",
       "4         0              0.65  "
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#returns the first x number of rows when head(num(.without a number it returns 5\n",
    "df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "eac44a6a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Serial No.</th>\n",
       "      <th>GRE Score</th>\n",
       "      <th>TOEFL Score</th>\n",
       "      <th>University Rating</th>\n",
       "      <th>SOP</th>\n",
       "      <th>LOR</th>\n",
       "      <th>CGPA</th>\n",
       "      <th>Research</th>\n",
       "      <th>Chance of Admit</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>495</th>\n",
       "      <td>496</td>\n",
       "      <td>332</td>\n",
       "      <td>108</td>\n",
       "      <td>5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.0</td>\n",
       "      <td>9.02</td>\n",
       "      <td>1</td>\n",
       "      <td>0.87</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>496</th>\n",
       "      <td>497</td>\n",
       "      <td>337</td>\n",
       "      <td>117</td>\n",
       "      <td>5</td>\n",
       "      <td>5.0</td>\n",
       "      <td>5.0</td>\n",
       "      <td>9.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.96</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>497</th>\n",
       "      <td>498</td>\n",
       "      <td>330</td>\n",
       "      <td>120</td>\n",
       "      <td>5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>5.0</td>\n",
       "      <td>9.56</td>\n",
       "      <td>1</td>\n",
       "      <td>0.93</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>498</th>\n",
       "      <td>499</td>\n",
       "      <td>312</td>\n",
       "      <td>103</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>5.0</td>\n",
       "      <td>8.43</td>\n",
       "      <td>0</td>\n",
       "      <td>0.73</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>499</th>\n",
       "      <td>500</td>\n",
       "      <td>327</td>\n",
       "      <td>113</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.04</td>\n",
       "      <td>0</td>\n",
       "      <td>0.84</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "     Serial No.  GRE Score  TOEFL Score  University Rating  SOP  LOR   CGPA  \\\n",
       "495         496        332          108                  5  4.5   4.0  9.02   \n",
       "496         497        337          117                  5  5.0   5.0  9.87   \n",
       "497         498        330          120                  5  4.5   5.0  9.56   \n",
       "498         499        312          103                  4  4.0   5.0  8.43   \n",
       "499         500        327          113                  4  4.5   4.5  9.04   \n",
       "\n",
       "     Research  Chance of Admit   \n",
       "495         1              0.87  \n",
       "496         1              0.96  \n",
       "497         1              0.93  \n",
       "498         0              0.73  \n",
       "499         0              0.84  "
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#returns the first x number of rows when tail(num).without a number it returns 5\n",
    "df.tail()\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "a1eadcee",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Serial No.           False\n",
       "GRE Score            False\n",
       "TOEFL Score          False\n",
       "University Rating    False\n",
       "SOP                  False\n",
       "LOR                  False\n",
       "CGPA                 False\n",
       "Research             False\n",
       "Chance of Admit      False\n",
       "dtype: bool"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#returns true for a column having null values ,else false\n",
    "df.isnull().any()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "60d9730c",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Index(['Serial No.', 'GRE Score', 'TOEFL Score', 'University Rating', 'SOP',\n",
       "       'LOR ', 'CGPA', 'Research', 'Chance of Admit '],\n",
       "      dtype='object')"
      ]
     },
     "execution_count": 10,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# returns an object with alll of the column headers\n",
    "df.columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "1b80d9c2",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Serial No.</th>\n",
       "      <th>GRE</th>\n",
       "      <th>TOEFL</th>\n",
       "      <th>University Rating</th>\n",
       "      <th>SOP</th>\n",
       "      <th>LOR</th>\n",
       "      <th>CGPA</th>\n",
       "      <th>Research</th>\n",
       "      <th>probability</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>337</td>\n",
       "      <td>118</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.65</td>\n",
       "      <td>1</td>\n",
       "      <td>0.92</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>324</td>\n",
       "      <td>107</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>4.5</td>\n",
       "      <td>8.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.76</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>316</td>\n",
       "      <td>104</td>\n",
       "      <td>3</td>\n",
       "      <td>3.0</td>\n",
       "      <td>3.5</td>\n",
       "      <td>8.00</td>\n",
       "      <td>1</td>\n",
       "      <td>0.72</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>322</td>\n",
       "      <td>110</td>\n",
       "      <td>3</td>\n",
       "      <td>3.5</td>\n",
       "      <td>2.5</td>\n",
       "      <td>8.67</td>\n",
       "      <td>1</td>\n",
       "      <td>0.80</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>314</td>\n",
       "      <td>103</td>\n",
       "      <td>2</td>\n",
       "      <td>2.0</td>\n",
       "      <td>3.0</td>\n",
       "      <td>8.21</td>\n",
       "      <td>0</td>\n",
       "      <td>0.65</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   Serial No.  GRE  TOEFL  University Rating  SOP  LOR  CGPA  Research  \\\n",
       "0           1  337    118                  4  4.5  4.5  9.65         1   \n",
       "1           2  324    107                  4  4.0  4.5  8.87         1   \n",
       "2           3  316    104                  3  3.0  3.5  8.00         1   \n",
       "3           4  322    110                  3  3.5  2.5  8.67         1   \n",
       "4           5  314    103                  2  2.0  3.0  8.21         0   \n",
       "\n",
       "   probability  \n",
       "0         0.92  \n",
       "1         0.76  \n",
       "2         0.72  \n",
       "3         0.80  \n",
       "4         0.65  "
      ]
     },
     "execution_count": 11,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#renaming the columns\n",
    "df=df.rename(columns={\"GRE Score\":\"GRE\",\"TOEFL Score\":\"TOEFL\",'LOR ':'LOR', 'Chance of Admit ':\"probability\"})\n",
    "df.head()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1ba74d66",
   "metadata": {},
   "source": [
    "# data visulization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "9e1d302b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature GRE \n",
    "fig=plt.hist(df[\"GRE\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of GRE Scores\")\n",
    "plt.xlabel(\"GRE Scores\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "b38b2aea",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "fig=plt.hist(df[\"TOEFL\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of TOEFLScores\")\n",
    "plt.xlabel(\"TOEFL Scores\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "75b6b099",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "\n",
    "fig=plt.hist(df[\"University Rating\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of university Rating\")\n",
    "plt.xlabel(\"University Rating\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "98ffb583",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "fig=plt.hist(df[\"SOP\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of SOP\")\n",
    "plt.xlabel(\"SOP Rating\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "62447de3",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "fig = plt.hist(df['LOR'],rwidth=0.7)\n",
    "plt.title(\"Distribution of LOR Rating\")\n",
    "plt.xlabel('LOR Rating')\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "60531e2f",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "fig=plt.hist(df[\"CGPA\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of CGPA\")\n",
    "plt.xlabel(\"CGPA\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "b34acaa5",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visulizing the feature  TOEFL\n",
    "fig=plt.hist(df[\"Research\"],rwidth=0.7)\n",
    "plt.title(\"Distribution of Research Papers\")\n",
    "plt.xlabel(\"Research\")\n",
    "plt.ylabel(\"count\")\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "128fdba1",
   "metadata": {},
   "source": [
    "# DATA CLEANING"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "30cc576e",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>GRE</th>\n",
       "      <th>TOEFL</th>\n",
       "      <th>University Rating</th>\n",
       "      <th>SOP</th>\n",
       "      <th>LOR</th>\n",
       "      <th>CGPA</th>\n",
       "      <th>Research</th>\n",
       "      <th>probability</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>337</td>\n",
       "      <td>118</td>\n",
       "      <td>4</td>\n",
       "      <td>4.5</td>\n",
       "      <td>4.5</td>\n",
       "      <td>9.65</td>\n",
       "      <td>1</td>\n",
       "      <td>0.92</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>324</td>\n",
       "      <td>107</td>\n",
       "      <td>4</td>\n",
       "      <td>4.0</td>\n",
       "      <td>4.5</td>\n",
       "      <td>8.87</td>\n",
       "      <td>1</td>\n",
       "      <td>0.76</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>316</td>\n",
       "      <td>104</td>\n",
       "      <td>3</td>\n",
       "      <td>3.0</td>\n",
       "      <td>3.5</td>\n",
       "      <td>8.00</td>\n",
       "      <td>1</td>\n",
       "      <td>0.72</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>322</td>\n",
       "      <td>110</td>\n",
       "      <td>3</td>\n",
       "      <td>3.5</td>\n",
       "      <td>2.5</td>\n",
       "      <td>8.67</td>\n",
       "      <td>1</td>\n",
       "      <td>0.80</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>314</td>\n",
       "      <td>103</td>\n",
       "      <td>2</td>\n",
       "      <td>2.0</td>\n",
       "      <td>3.0</td>\n",
       "      <td>8.21</td>\n",
       "      <td>0</td>\n",
       "      <td>0.65</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   GRE  TOEFL  University Rating  SOP  LOR  CGPA  Research  probability\n",
       "0  337    118                  4  4.5  4.5  9.65         1         0.92\n",
       "1  324    107                  4  4.0  4.5  8.87         1         0.76\n",
       "2  316    104                  3  3.0  3.5  8.00         1         0.72\n",
       "3  322    110                  3  3.5  2.5  8.67         1         0.80\n",
       "4  314    103                  2  2.0  3.0  8.21         0         0.65"
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#removing the serial no,columns\n",
    "df.drop('Serial No.', axis ='columns', inplace = True)\n",
    "df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "f36dd03a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "GRE                  0\n",
       "TOEFL                0\n",
       "University Rating    0\n",
       "SOP                  0\n",
       "LOR                  0\n",
       "CGPA                 0\n",
       "Research             0\n",
       "probability          0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#replacing the 0 values from [\"GRE\",\"TOEFL\",\"UNIVERSITY RATING\"  ,\"SOP\",\"LOR\",\"CGPA\"] BY NAN\n",
    "df_copy = df.copy(deep= True)\n",
    "df_copy[[\"GRE\",\"TOEFL\",\"University Rating\" ,\"SOP\",\"LOR\",\"CGPA\"]]=df_copy [[\"GRE\",\"TOEFL\",\"University Rating\" ,\"SOP\"\n",
    ",\"LOR\",\"CGPA\"]].replace(0,np.NaN)\n",
    "df_copy.isnull().sum()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "83ec4501",
   "metadata": {},
   "source": [
    "# MODEL BUILDING"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "686783cb",
   "metadata": {},
   "outputs": [],
   "source": [
    "#SPLITTING THE DAATASET IN FEATURES AND LABEL\n",
    "\n",
    "x=df_copy.drop(\"probability\",axis = \"columns\")\n",
    "y=df_copy[\"probability\"]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "ae6076f7",
   "metadata": {},
   "outputs": [],
   "source": [
    "#using grid search cv to find the best algorithm for this problem\n",
    "from sklearn.model_selection import GridSearchCV\n",
    "from sklearn.linear_model import LinearRegression \n",
    "from sklearn.linear_model import Lasso\n",
    "from sklearn.svm import SVR\n",
    "from sklearn.tree import DecisionTreeRegressor\n",
    "from sklearn.ensemble import RandomForestRegressor\n",
    "from sklearn.neighbors import KNeighborsRegressor"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "6f645f6f",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>model</th>\n",
       "      <th>best_parameters</th>\n",
       "      <th>score</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>linear_regression</td>\n",
       "      <td>{'normalize': True}</td>\n",
       "      <td>0.810802</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>lasso</td>\n",
       "      <td>{'alpha': 1, 'selection': 'random'}</td>\n",
       "      <td>0.215088</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>svr</td>\n",
       "      <td>{'gamma': 'scale'}</td>\n",
       "      <td>0.654099</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>decision_tree</td>\n",
       "      <td>{'criterion': 'mse', 'splitter': 'random'}</td>\n",
       "      <td>0.553057</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>random forest</td>\n",
       "      <td>{'n_estimators': 20}</td>\n",
       "      <td>0.778641</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>5</th>\n",
       "      <td>knn</td>\n",
       "      <td>{'n_neighbors': 20}</td>\n",
       "      <td>0.722961</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "               model                             best_parameters     score\n",
       "0  linear_regression                         {'normalize': True}  0.810802\n",
       "1              lasso         {'alpha': 1, 'selection': 'random'}  0.215088\n",
       "2                svr                          {'gamma': 'scale'}  0.654099\n",
       "3      decision_tree  {'criterion': 'mse', 'splitter': 'random'}  0.553057\n",
       "4      random forest                        {'n_estimators': 20}  0.778641\n",
       "5                knn                         {'n_neighbors': 20}  0.722961"
      ]
     },
     "execution_count": 38,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#creating a function to calculate best model for this problem\n",
    "\n",
    "def find_best_model(x,y):\n",
    "    models={\n",
    "        'linear_regression':{\n",
    "            'model':LinearRegression(),\n",
    "            'parameters': {\n",
    "                'normalize':[True,False]\n",
    "                \n",
    "            }\n",
    "        },\n",
    "        'lasso':{\n",
    "            'model':Lasso(),\n",
    "            'parameters': {\n",
    "                'alpha':[1,2],\n",
    "                'selection':['random','cyclic']\n",
    "            }\n",
    "        },\n",
    "        \n",
    "        'svr':{\n",
    "            'model':SVR(),\n",
    "            'parameters': {\n",
    "                'gamma':['auto','scale']\n",
    "            }\n",
    "        },\n",
    "        \n",
    "        'decision_tree': {\n",
    "            'model': DecisionTreeRegressor(),\n",
    "            'parameters': {\n",
    "                'criterion': ['mse','friedman_mse'],\n",
    "                'splitter':['best','random']\n",
    "            }\n",
    "        },\n",
    "        'random forest': {\n",
    "            'model':RandomForestRegressor(criterion='mse'),\n",
    "            'parameters': {\n",
    "                'n_estimators':[5,10,15,20]\n",
    "            }\n",
    "        },\n",
    "        \n",
    "        'knn':{\n",
    "            'model':KNeighborsRegressor(algorithm='auto'),\n",
    "            'parameters':{\n",
    "                'n_neighbors':[2,5,10,20]\n",
    "            }\n",
    "        }\n",
    "    }\n",
    "    \n",
    "    scores=[]\n",
    "    for model_name,model_params in models.items():\n",
    "        gs=GridSearchCV(model_params['model'],model_params['parameters'],cv=5,return_train_score=False)\n",
    "        gs.fit(x,y)\n",
    "        scores.append({\n",
    "            'model':model_name,\n",
    "            'best_parameters':gs.best_params_,\n",
    "            'score': gs.best_score_\n",
    "        })\n",
    "        \n",
    "    return pd.DataFrame(scores,columns=['model','best_parameters','score'])\n",
    "    \n",
    "find_best_model(x,y)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "da4e2513",
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Highest Accuracy:81%\n"
     ]
    }
   ],
   "source": [
    "#using cross_val_score for gaining highest accuracy\n",
    "from sklearn.model_selection import cross_val_score\n",
    "scores=cross_val_score(LinearRegression(normalize=True),x,y,cv=5)\n",
    "print('Highest Accuracy:{}%'.format(round(sum(scores)*100/len(scores)),3))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "id": "ca9d49ad",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "400 100\n"
     ]
    }
   ],
   "source": [
    " from sklearn.model_selection import train_test_split\n",
    "x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=5)\n",
    "print(len(x_train),len(x_test))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 48,
   "id": "231b1eee",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0.8214787365889659"
      ]
     },
     "execution_count": 48,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#creating  linear regression model \n",
    "model=LinearRegression(normalize=True)\n",
    "model.fit(x_train,y_train)\n",
    "model.score(x_test,y_test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "id": "843ca457",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "chance of getting into UCLA is 71.399%,\n"
     ]
    }
   ],
   "source": [
    "#prediction 1\n",
    "#input in the form: GRE,TOEFL,University rating,sop,lor,cgpa,research\n",
    "print('chance of getting into UCLA is {}%,'.format(round(model.predict([[337,1,18,4,4.5,9.65,0]])[0]*100,3)))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 51,
   "id": "897003b1",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "chance of getting into UCLA is 50.675%\n"
     ]
    }
   ],
   "source": [
    "#prediction 2\n",
    "#input in the form: GRE,TOEFL,University rating,sop,lor,cgpa,research\n",
    "print('chance of getting into UCLA is {}%'.format(round(model.predict([[320,1,13,2,2.0,8.65,1]])[0]*100,3)))\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1b76f912",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e1c4b7cc",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4791ae0c",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
