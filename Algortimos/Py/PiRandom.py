import numpy as np

num_points = 10000000

# Generate random points in the unit square
points = np.random.uniform(0, 1, (num_points, 2))

# Count points within the unit circle
distances = np.sum(points**2, axis=1)
num_in_circle = np.sum(distances <= 1)

pi_estimate = 4.0 * num_in_circle / num_points
print("Estimate of PI:", pi_estimate)
