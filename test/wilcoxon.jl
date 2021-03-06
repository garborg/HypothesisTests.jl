using HypothesisTests, Base.Test

## MANN-WHITNEY U

# Basic exact test
@test abs(pvalue(ExactMannWhitneyUTest([1:10], [2.1:2:21])) - 0.0232) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([2.1:2:21], [1:10])) - 0.0232) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([1.5:10:100], [2.1:2:21])) - 0.0068) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([2.1:2:21], [1.5:10:100])) - 0.0068) <= 1e-4

# Exact with ties
@test abs(pvalue(ExactMannWhitneyUTest([1:10], [1:10])) - 1) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([1:10], [2:11])) - 0.5096) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([2:11], [1:10])) - 0.5096) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([1:10], [1:5, ones(5)])) - 0.0057) <= 1e-4
@test abs(pvalue(ExactMannWhitneyUTest([1:5, ones(5)], [1:10])) - 0.0057) <= 1e-4

# Approximate test
@test abs(pvalue(ApproximateMannWhitneyUTest([1:10], [2.1:2:21])) - 0.0257) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([2.1:2:21], [1:10])) - 0.0257) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([1.5:10:100], [2.1:2:21])) - 0.0091) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([2.1:2:21], [1.5:10:100])) - 0.0091) <= 1e-4

# Approximate with ties
@test abs(pvalue(ApproximateMannWhitneyUTest([1:10], [1:10])) - 1) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([1:10], [2:11])) - 0.4948) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([2:11], [1:10])) - 0.4948) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([1:10], [1:5, ones(5)])) - 0.0076) <= 1e-4
@test abs(pvalue(ApproximateMannWhitneyUTest([1:5, ones(5)], [1:10])) - 0.0076) <= 1e-4

# Tests for automatic selection
@test abs(pvalue(MannWhitneyUTest([1:10], [2.1:2:21])) - 0.0232) <= 1e-4
@test abs(pvalue(MannWhitneyUTest([1:10], [2:11])) - 0.4948) <= 1e-4

## WILCOXON SIGNED RANK

# Basic exact test
@test abs(pvalue(ExactSignedRankTest([1:10], [2:2:20])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:2:20], [1:10])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:10], [2:2:16, -1, 1])) - 0.4316) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:2:16, -1, 1], [1:10])) - 0.4316) <= 1e-4

# Exact with ties
@test abs(pvalue(ExactSignedRankTest([1:10], [1:10])) - 1) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:10], [2:11])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:11], [1:10])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:10], [1:5, ones(5)])) - 0.0625) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:5, ones(5)], [1:10])) - 0.0625) <= 1e-4

# Approximate test
@test abs(pvalue(ApproximateSignedRankTest([1:10], [2:2:20])) - 0.005922) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([2:2:20], [1:10])) - 0.005922) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([1:10], [2:2:16, -1, 1])) - 0.4148) <= 1e-4
@test abs(pvalue(ApproximateSignedRankTest([2:2:16, -1, 1], [1:10])) - 0.4148) <= 1e-4

# Approximate with ties
@test abs(pvalue(ApproximateSignedRankTest([1:10], [1:10])) - 1) <= 1e-4
@test abs(pvalue(ApproximateSignedRankTest([1:10], [2:11])) - 0.001904) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([2:11], [1:10])) - 0.001904) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([1:10], [1:5, ones(5)])) - 0.05906) <= 1e-5
@test abs(pvalue(ApproximateSignedRankTest([1:5, ones(5)], [1:10])) - 0.05906) <= 1e-5

# Tests for automatic selection
@test abs(pvalue(SignedRankTest([1:10], [2:2:20])) - 0.0020) <= 1e-4
@test abs(pvalue(SignedRankTest([1:10], [2:11])) - 0.0020) <= 1e-4