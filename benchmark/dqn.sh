poetry install
OMP_NUM_THREADS=1 xvfb-run -a python -m cleanrl_utils.benchmark \
    --env-ids CartPole-v1 Acrobot-v1 MountainCar-v0 \
    --command "poetry run python cleanrl/dqn.py --cuda False --track --capture-video" \
    --num-seeds 3 \
    --workers 9

poetry install -E atari
OMP_NUM_THREADS=1 xvfb-run -a python -m cleanrl_utils.benchmark \
    --env-ids PongNoFrameskip-v4 BeamRiderNoFrameskip-v4 BreakoutNoFrameskip-v4 \
    --command "poetry run python cleanrl/dqn_atari.py --track --capture-video" \
    --num-seeds 3 \
    --workers 1
