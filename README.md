# ClanBasedCulturalAlgorithFS
Clan-based Cultural Algorithm for Feature Selection
Programmed by Oloruntoba Oluwabunmi
Last revised:  Sept 2019
Programming language: MATLAB

The code in this repsitory contains the proposed Clan-based Cultural Algorithm for 
Feature Selection described in our paper.

Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
Feature Selection. In: IEEE International Conference on Data Minning (ICDM 2019), November 8-11, 2019, Beijing China


Abstract:

Feature selection is the process of selecting a subset of relevant features from datasets, which can then be used for building machine learning models. In this study we propose a novel multi-population Clan-based Cultural algorithm (CCA) for feature selection. CCA models the complex social interactions within a clan-based society. Each population or clan contains solutions that are closely related and are managed by the population's own local belief space. There is also a global belief space that is shared by clans creating a tiered belief space structure. The global belief space contains the best solution across all the clans and provides the algorithm with a local and global view of the search landscape. At given generations, individual solutions migrate to another clan, different from its source clan, and combines with the clans population to form a single mating pool. Crossover and mutation operators are then applied and the fittest solutions are selected. This ensures that the search is directed toward the global optimum. The proposed algorithm was tested on benchmark datasets and its performance was compared with other evolutionary based feature selection methods. Results show that CCA achieved the highest accuracy, AUC and F1 values of 99.3%, 99.2% and 99.1% respectively across most of the datasets. The proposed CCA model selected fewer features to achieve its highest performance values than alternative approaches, suggesting CCA is more effective as a feature selection model. 

If you wish to run the CCA using the human activity sample dataset which is already included in MATLAB datasets simply run the main.m file.
If you wish to run the CCA using your own dataset, then follow the steps below.

The steps for running the code are as follows:
1. Open the preprocess_data.m file and prepre it for the dataset you wish to use.
Note: the target values need to be in numerical format. 
2. Run the main.m file. This is the entry point for the code.
3. Please note the CCA uses the KNN classifier (defined in the knn.m script).  If you wish you can modify the classifier to any classifier of your choice. Simply change the classifier model in line 49.

Please e-mail us if you find bugs. bunmi_toba@yahoo.com
