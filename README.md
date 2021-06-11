# pDOC
意识障碍的预后预测

zxr_spmpre_FC.m
对fMRI数据进行预处理，同时进行不同ROI与全脑的功能连接

NII_part.m
对包含16个皮层下脑区的图谱进行划分，得到16个皮下核团区域对应的NII文件

zxr_mergeROI.m
将左前丘脑与左后丘脑、右前丘脑与右后丘脑、左海马与右海马、左杏仁核与右杏仁核、左丘脑与右丘脑进行合并

classify_model.m
建立了基于支持向量机、随机森林、逻辑回归和决策树的意识障碍预后预测模型

fMRI_ANOVA.m
在正常人中进行ANOVA分析：影响采集时间及不同的ROI是否对预后分数有影响

smote.ipynb
使用SMOTE算法对训练集中的少数类进行过采样平衡
