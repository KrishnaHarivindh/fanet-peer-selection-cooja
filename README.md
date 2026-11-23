# FANET Peer Selection Cooja Demo

An educational Contiki-NG/Cooja simulation of a five-node disaster-response FANET. A survivor alert traverses UAV-to-UAV links to a ground station while relays log an illustrative next-hop score.

## Set up in Contiki-NG

This repository contains the mote source and Cooja simulation configuration. It does not bundle Contiki-NG or its toolchain.

1. Install Contiki-NG and its Cooja build prerequisites using the official project instructions.
2. In the Contiki-NG checkout, copy the source and simulation file into the paths expected by the configuration:

   ```bash
   mkdir -p ~/contiki-ng/examples/fanet-disaster
   cp fanet_disaster_peer_selection.c ~/contiki-ng/examples/fanet-disaster/
   cp FANET_Disaster_Response_Peer_Selection.csc ~/contiki-ng/simulations/
   ```

   Run these copy commands from this repository's directory.
3. Launch Cooja with the simulation:

   ```bash
   cd ~/contiki-ng/tools/cooja
   ./gradlew run ~/contiki-ng/simulations/FANET_Disaster_Response_Peer_Selection.csc
   ```

4. Start the simulation. Use **Mote Output** to inspect the alert, scores, selected next hop, and sink delivery. **Tools → Radio messages** shows simulated radio activity.

## Node roles

| Mote | Role |
| --- | --- |
| UAV1 | Creates a survivor alert |
| UAV2–UAV4 | Score eligible peers and relay the alert |
| UAV5 | Ground station / sink |

The weighted score uses fixed illustrative inputs for distance benefit, residual energy, link quality, stability, trust, and congestion benefit. The selected next hop is carried in the alert so the multi-hop path is visible.

## Scope and limitations

This is an educational framework prototype. Inputs are fixed examples, not live radio measurements. The score is a transparent weighted example, not a complete Adaptive SOA optimizer. Trust participates in ranking, but cryptographic security and attack/detection experiments are not implemented. The simulation demonstrates the use-case flow; it does not validate performance claims or predict real-world network behavior.

The Cooja simulation expects Contiki-NG at `~/contiki-ng`. Java and the Contiki-NG toolchain are required. The screenshots and course use-case document from the source folder are omitted from this public repository.
