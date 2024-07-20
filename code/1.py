def floyd_algorithm(graph, start, end):
    """
    Floyd算法求解最短路径
    :param graph: 邻接矩阵，表示各点之间的距离。如果不连通，则相应权重为无穷大（例如1000）
    :param start: 起点
    :param end: 终点
    :return: 最短路径长度，最短路径
    """
    inf = 0x3f3f3f3f
    n = len(graph)  # 图中节点的个数
    distances = {node: {n: inf for n in range(n)} \
                 for node in range(n)}  # 初始化距离矩阵
    path = {node: {n: [] for n in range(n)} \
            for node in range(n)}  # 初始化路径矩阵

    # 将graph的值复制到distances中，并初始化path矩阵
    for i in range(n):
        for j in range(n):
            distances[i][j] = graph[i][j]
            if i != j and graph[i][j] != inf:
                path[i][j].append(i)
                path[i][j].append(j)

    # Floyd算法核心代码
    for k in range(n):
        for i in range(n):
            for j in range(n):
                new_distance = distances[i][k] + distances[k][j]
                if new_distance < distances[i][j]:
                    distances[i][j] = new_distance
                    path[i][j] = path[i][k] + path[k][j][1:]

    # 返回最短路径长度和最短路径
    return distances[start][end], path[start][end]